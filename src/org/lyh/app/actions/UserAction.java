package org.lyh.app.actions;

import com.opensymphony.xwork2.ModelDriven;
import org.lyh.app.base.BaseAction;
import org.lyh.app.entitys.UserEntity;
import org.lyh.app.services.UserService;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-28.
 */
public class UserAction extends BaseAction implements ModelDriven<UserEntity>{

    private UserEntity userEntity = new UserEntity();

    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @Override
    public UserEntity getModel() {
        return this.userEntity;
    }

    public String activation(){

        if(userEntity.getCode()!=null && !"".equals(userEntity.getCode().trim())){
            boolean ok = userService.activationUser(userEntity);
            if(ok){
                return "r-site-login";
            }else{
                return "r-site-index";
            }
        }else{
            return "r-site-index";
        }
    }



}
