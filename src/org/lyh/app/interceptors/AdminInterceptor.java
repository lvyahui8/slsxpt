package org.lyh.app.interceptors;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import org.lyh.app.entitys.UserEntity;

/**
 * Created by admin on 2015/7/4.
 */
public class AdminInterceptor extends AbstractInterceptor {
    @Override
    public String intercept(ActionInvocation actionInvocation) throws Exception {
        UserEntity user = (UserEntity) actionInvocation.getInvocationContext().getSession().get("loginUser");
        //System.out.println("拦截器工作");
        //return actionInvocation.invoke();

        if(user != null){
            if("admin".equals(user.getType()) || "root".equals(user.getType())){
                return actionInvocation.invoke();
            }else{
                // 普通会员
                return "r-site-index";
            }
        }else{
            // 没有登陆
            return "r-site-login";
        }

    }
}
