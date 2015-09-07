package org.lyh.app.services;

import com.opensymphony.xwork2.ActionContext;
import com.sun.xml.internal.org.jvnet.mimepull.MIMEMessage;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Restrictions;
import org.lyh.app.base.BaseService;
import org.lyh.app.base.paging.PageData;
import org.lyh.app.daos.UserDao;
import org.lyh.app.entitys.ProjectEntity;
import org.lyh.app.entitys.UserEntity;
import org.lyh.library.SiteHelpers;
import org.springframework.mail.javamail.JavaMailSenderImpl;

import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.transaction.Transactional;
import java.sql.Time;
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
    private JavaMailSenderImpl mailSender;

    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    public void setMailSender(JavaMailSenderImpl mailSender) {
        this.mailSender = mailSender;
    }

    public UserEntity find(UserEntity userEntity) {
//        return userDao.
        return null;
    }

    public boolean addUser(final UserEntity userEntity) {
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
        boolean added = userDao.save(userEntity) != null;
        if(added){

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
        return added;
    }

    public boolean activationUser(UserEntity userEntity){
        Map<String,Object> condition = new HashMap<String,Object>();
        condition.put("code",userEntity.getCode());
        userEntity = this.getFirstByAttributes(condition);

        if(userEntity != null){
            userEntity.setCode("");
            userDao.save(userEntity);
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

    public PageData<UserEntity> getUsers(PageData<UserEntity> pageData) {
        List<Criterion> condition = new ArrayList<Criterion>();
//        condition.add(Restrictions.in("type",new String[]{"admin","customer"}));
        condition.add(Restrictions.ne("type","root"));
        return this.userDao.findByPage(condition, pageData, "createdAt");
    }

    public UserEntity getUser(Integer id) {
        return userDao.get(id);
    }

    public void update(UserEntity user) {
        UserEntity existUser = userDao.get(user.getId());
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
        userDao.save(existUser);
    }

    public void add(UserEntity user) {

    }

    public UserEntity getFirstByAttributes(Map<String, Object> condition){
        return this.userDao.getFirst(condition);
    }

}
