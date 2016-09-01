package org.lyh.app.services;

import com.opensymphony.xwork2.ActionContext;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.lyh.app.daos.BaseDao;
import org.lyh.app.daos.CollegeDao;
import org.lyh.app.entitys.CollegeEntity;
import org.lyh.library.paging.PageData;
import org.lyh.app.daos.UserDao;
import org.lyh.app.entitys.UserEntity;
import org.lyh.library.SiteHelpers;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-27.
 */
@Service
@Transactional
public class UserService extends BaseService<UserEntity> {

    private CollegeDao collegeDao;//user中需要使用到collegeDao，进行注入操作，并提供set方法

    public void setCollegeDao(CollegeDao collegeDao) {
        this.collegeDao = collegeDao;
    }

    private JavaMailSenderImpl mailSender;

    public void setMailSender(JavaMailSenderImpl mailSender) {
        this.mailSender = mailSender;
    }

    @Override
    public Integer add(final UserEntity userEntity) {
        // 设置
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        userEntity.setCreatedAt(currentTime);
        userEntity.setUpdatedAt(currentTime);
        // 设置密码
        userEntity.setSalt(SiteHelpers.uuid());
        userEntity.setPassword(SiteHelpers.hashPassword(
            userEntity.getPassword(),
            userEntity.getSalt()
        ));
        // 设置激活码
        final String code = SiteHelpers.uuid();
        userEntity.setCode(code);
        Integer newId = baseDao.save(userEntity);
        if(newId > 0){
            /*
             * 发送邮件
             */
            new Thread(new Runnable() {
                @Override
                public void run() {
                    try {
                        MimeMessage mailMessage = mailSender.createMimeMessage();
                        MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,true,"utf-8");
                        messageHelper.setTo(userEntity.getEmail());
                        messageHelper.setFrom("devlyh@163.com");
                        messageHelper.setSubject("注册");

                        messageHelper.setText("<html><head><meta charset='utf-8'></head><body>" +
                            "去<a target='_blank' " +
                            "href='http://localhost/slsxpt/user-activation.action?code="+
                            code +
                            "' >激活</a>" +
                            "</body></html>",true);
                        mailSender.send(mailMessage);
                    } catch (MessagingException e) {
                        e.printStackTrace();
                    }
                }
            }).start();
        }
        return newId;
    }

    public boolean activationUser(UserEntity userEntity){
        Map<String,Object> condition = new HashMap<>();
        condition.put("code",userEntity.getCode());
        userEntity = this.getFirstByAttributes(condition);

        if(userEntity != null){
            userEntity.setCode("");
            baseDao.save(userEntity);
            return true;
        }else{
            return false;
        }

    }

    public UserEntity getByUserName(String username) {
        Map<String,Object> condition = new HashMap<String,Object>();
        condition.put("username", username);
        return this.getFirstByAttributes(condition);
    }

    public boolean loginUser(UserEntity user) {
        ActionContext.getContext().getSession().put("loginUser", user);
        return true;
    }

    @Override
    public PageData<UserEntity> getDatas(PageData<UserEntity> pageData) {
        List<Criterion> condition = new ArrayList<>();
//        condition.add(Restrictions.in("type",new String[]{"admin","customer"}));
        condition.add(Restrictions.ne("type", "root"));
        return this.baseDao.findByPage(condition, pageData, "createdAt");
    }

    @Override
    public void update(UserEntity user) {
        UserEntity existUser = baseDao.get(user.getId());
        if(user.getUsername() != null && !"".equals(user.getUsername())){
            existUser.setUsername(user.getUsername());
        }
        if(user.getEmail() != null && !"".equals(user.getEmail())){
            existUser.setEmail(user.getEmail());
        }
        if(user.getAvatar() != null && !"".equals(user.getAvatar())){
            existUser.setAvatar(user.getAvatar());
        }
        if(user.getType() != null && !"".equals(user.getType())){
            existUser.setType(user.getType());
        }
        baseDao.save(existUser);
    }


    public UserEntity getFirstByAttributes(Map<String, Object> condition){
        return this.baseDao.getFirst(condition);
    }

    public UserEntity getByEmail(String email){
        List<UserEntity> users = this.baseDao.where("email",email).get();
        return users != null && users.size() > 0 ?  users.get(0) : null;
    }

    /**
     * 修改用户信息
     * */
    public void updateInfo(UserEntity user){
        UserEntity existUser = baseDao.get(user.getId());//该方法是从session中获得已经登录的用户名
        existUser.setName(user.getName());//修改真实姓名
//        if(existUser.getCollegeId()!=null && !"".equals(existUser.getCategoryId())){
//            existUser.setCollegeId(user.getCollegeId());//修改专业
            existUser.setCollege(collegeDao.get(user.getCollegeId()));
//        }
        existUser.setClazz(user.getClazz());//修改班级
        existUser.setLabel(user.getLabel());//修改个性签名
        existUser.setPhone(user.getPhone());//修改电话
        baseDao.save(existUser);//保存到数据库
        ActionContext.getContext().getSession().put("loginUser",existUser);
    }

    public List<CollegeEntity> allColleges(){
        return collegeDao.all();
    }

}
