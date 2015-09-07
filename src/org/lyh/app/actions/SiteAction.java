package org.lyh.app.actions;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import org.lyh.app.base.BaseAction;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.UserEntity;
import org.lyh.app.services.CategoryService;
import org.lyh.app.services.UserService;
import org.lyh.library.SiteHelpers;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by lvyahui on 2015-06-17.
 */
public class SiteAction extends BaseAction implements ModelDriven<UserEntity>{

    private CategoryService categoryService;
    private UserService userService;

    private UserEntity userEntity = new UserEntity();

    public void setUserEntity(UserEntity userEntity) {
        this.userEntity = userEntity;
    }

    @Override
    public UserEntity getModel() {
        return this.userEntity;
    }

    /* service 注入*/
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }


    public String index(){
        ActionContext ac = ActionContext.getContext();
        if(ac.getSession().get("topCategorys") == null){
            List<CategoryEntity> categorys = categoryService.getTopCategorys();
            ac.getSession().put("topCategorys", categorys);
        }
        return SUCCESS;
    }

    public String register(){
        return SUCCESS;
    }

    public String postRegister(){

        //userEntity.fill(this.request.getParameterMap());
        //System.out.println(userEntity);
        Map<String,Object> dataJson;
        dataJson = new HashMap<String,Object>();
        dataJson.put("submitted_data", this.request.getParameterMap());

        if(userEntity.validate()){
            //System.out.println("验证通过");

            boolean added = userService.addUser(userEntity);

            dataJson.put("success",true);
        }
        else{
            //System.out.println(userEntity.getErrors());
            dataJson.put("success", false);
            dataJson.put("errors",userEntity.getErrors());
        }


        this.responceJson(dataJson);
        return NONE;
    }

    public String login(){

        return SUCCESS;
    }

    public String postLogin(){
        //System.out.println(userEntity);
        Map<String,Object> dataJson = new HashMap<String,Object>();
        dataJson.put("submitted_data", this.request.getParameterMap());
        boolean success;
        UserEntity user = userService.getByUserName(userEntity.getUsername());

        if(user != null){
            // 检验密码
            String password = SiteHelpers.hashPassword(
                userEntity.getPassword().trim(),
                user.getSalt()
            );

            if(user.getPassword().equals(password)){
                // 密码正确
                if(userService.loginUser(user)){
                    success = true;
                    String redirect_url = null;
                    if("admin".equals(user.getType())
                            || "root".equals(user.getType())){
                        redirect_url = getBaseUrl()+"/admin";
                    }else{
                        redirect_url = getBaseUrl()+"/site-index.action";
                    }
                    dataJson.put("redirect_url",redirect_url);
                }
                else{
                    // 发生错误
                    success = false;
                }
            }else{
                // 密码错误
                success = false;
            }

        }else{
            // 用户名错误
            success = false;
        }
        dataJson.put("success",success);
        this.responceJson(dataJson);
        return NONE;
    }

    public String logout(){
        ActionContext.getContext().getSession().clear();
        return "r-site-index";
    }
}
