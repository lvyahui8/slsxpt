package org.lyh.app.actions;

import com.opensymphony.xwork2.ModelDriven;
import org.lyh.app.entitys.UserEntity;
import org.lyh.app.services.UserService;

/**
 * Created by lvyahui on 2015-06-28.
 */
public class UserAction extends BaseAction<UserEntity>{

    public String activation(){
        UserEntity userEntity = entity;
        if(userEntity.getCode()!=null && !"".equals(userEntity.getCode().trim())){
            boolean ok = ((UserService) baseService).activationUser(userEntity);
            if(ok){
                return "r-site-login";
            }else{
                return "r-site-index";
            }
        }else{
            return "r-site-index";
        }
    }


    public String profile(){
        return SUCCESS;
    }

    public String info(){
        bindData("colleges",((UserService)baseService).allColleges());
        return SUCCESS;
    }

    public String postInfo(){

        ((UserService)baseService).updateInfo(entity);

        return "r-user-profile";
    }

}
