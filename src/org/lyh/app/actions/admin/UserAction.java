package org.lyh.app.actions.admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import org.lyh.app.base.BaseAction;
import org.lyh.app.base.paging.PageData;
import org.lyh.app.entitys.UserEntity;
import org.lyh.app.services.UserService;

/**
 * Created by lvyahui on 2015-06-29.
 */
public class UserAction extends BaseAction implements ModelDriven<UserEntity> {
    private UserService userService;

    private UserEntity userModel = new UserEntity();

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    private Integer currentPage;

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    public String list(){
        PageData<UserEntity> pageData = new PageData<>();
        if(currentPage != null){
            pageData.setCurrentPage(currentPage);
        }
        pageData = this.userService.getUsers(pageData);
        if(pageData.getDatas() != null && pageData.getDatas().size() > 0){
            ActionContext.getContext().getValueStack().set("pageData",pageData);
        }
        return SUCCESS;
    }

    public String save(){

        if(userModel.getId()!=null){
            UserEntity user = userService.getUser(userModel.getId());
            if(user != null){
                ActionContext.getContext().getValueStack().set("user",user);
            }
        }
        return SUCCESS;
    }

    public String postSave(){
        if(userModel.getId() != null){
            userService.update(userModel);
        }else{
            userService.add(userModel);
        }
        return "r-user-list";
    }

    @Override
    public UserEntity getModel() {
        return userModel;
    }
}
