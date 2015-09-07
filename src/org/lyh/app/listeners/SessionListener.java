package org.lyh.app.listeners;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Created by lvyahui on 2015-06-26.
 */
public class SessionListener implements HttpSessionListener {
    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        System.out.println("新访客");
//        HttpSession session = httpSessionEvent.getSession();
//        /* 配置路径 */
//        String basePath = session.getServletContext().getContextPath();
//        session.setAttribute("assets",basePath+"/assets");
//        session.setAttribute("views",basePath+"/WEB-INF/views");
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        System.out.println("离开了");
    }
}
