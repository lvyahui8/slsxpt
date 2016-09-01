package org.lyh.app.actions;


import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.UserEntity;
import org.lyh.app.services.ArticleService;
import org.lyh.app.services.CategoryService;
import org.lyh.app.services.UserService;
import org.lyh.library.SiteHelpers;


import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by lvyahui on 2015-06-17.
 */
public class SiteAction extends BaseAction<UserEntity>{

    private CategoryService categoryService;
    private UserService userService;
    private ArticleService articleService;
    private UserEntity userEntity ;

    public SiteAction() {
        this.userEntity = super.entity;
    }

    /* service 注入*/
    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
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
        Map<String,Object> dataJson = new HashMap<>();
        dataJson.put("submitted_data", this.request.getParameterMap());
        String redirect_url;
        boolean success;
        if(userEntity.validate()){
            //System.out.println("验证通过");

           userService.add(userEntity);
            success = true;
//            dataJson.put("success", true);
            redirect_url = getBaseUrl()+"/site-signIn.action";
//            dataJson.put("redirect_url",redirect_url);
//            return  "r-site-signIn";
        }
        else{
            //System.out.println(userEntity.getErrors());
            success = false;
//            dataJson.put("success", false);
            redirect_url = getBaseUrl()+"/site-signUp.action";
//            dataJson.put("redirect_url",redirect_url);
            //dataJson.put("errors",userEntity.getErrors());
        }
        dataJson.put("success", success);
        dataJson.put("redirect_url",redirect_url);
        this.responceJson(dataJson);
//        return  "r-site-signUp";//注册不成功跳到注册网页
        return NONE;
    }

    public String checkEmail(){
        if(userEntity.getEmail() != null){
            UserEntity existUser = userService.getByEmail(userEntity.getEmail());
            if(existUser != null){
                this.responceJson(false);
            }else{
                this.responceJson(true);
            }
        }else{
            this.responceJson("0");
        }

        return NONE;
    }

    public String login(){
        return SUCCESS;
    }

    public String postLogin(){
        //System.out.println(userEntity);
        Map<String,Object> dataJson = new HashMap<>();
        dataJson.put("submitted_data", this.request.getParameterMap());
        boolean success;
        String error = null;
        String redirect_url = null;
        UserEntity user = userService.getByUserName(userEntity.getUsername());
        System.out.println(userEntity);
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
                    if("admin".equals(user.getType())
                            || "root".equals(user.getType())){
                        redirect_url = getBaseUrl()+"/admin";
                    }else{
                        redirect_url = getBaseUrl()+"/site-index.action";
                    }
//                    dataJson.put("redirect_url",redirect_url);
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
//        if(!success){
//            error = "用户名或密码错误";
//            ActionContext.getContext().getSession().put("loginError",error);//放入session中保存
//            redirect_url = getBaseUrl()+"/site-index.action";
//        }
        dataJson.put("redirect_url",redirect_url);
        dataJson.put("success", success);
        this.responceJson(dataJson);
        return NONE;
//        if(success){
//            ActionContext.getContext().getSession().put("loginUser",user);//放入session中保存
////            request.setAttribute("loginUser",user);
//            return  "r-site-index";
//        }
//        return "r-site-signIn";
    }

    public String logout(){
        ActionContext.getContext().getSession().clear();
        return "r-site-index";
    }

    public String signIn(){
        bindData("newArticles", this.articleService.getList(10, 0, "createdAt", true));//在登录界面放上最新发布文章的链接
        return SUCCESS;
    }

    public String signUp(){
        return SUCCESS;
    }
    public String forgetPassword(){
        return SUCCESS;
    }
    public String resetPassword(){
        return SUCCESS;
    }
}