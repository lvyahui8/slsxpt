package org.lyh.app.listeners;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by lvyahui on 2015-06-26.
 */
public class AppListener implements ServletContextListener{
    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        ServletContext app = servletContextEvent.getServletContext();
        String basePath = app.getContextPath();
        app.setAttribute("assets",basePath+"/assets");
        app.setAttribute("views",basePath+"/WEB-INF/views");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {

    }
}
