package org.lyh.app.base;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.lyh.app.entitys.UserEntity;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.Set;

/**
 * Created by lvyahui on 2015-06-17.
 */
public class BaseAction extends ActionSupport
//    implements ServletResponseAware,ServletRequestAware
{
    public final String REGISTER = "register";
    public final String JSON = "json";
    protected HttpServletResponse response;
    protected HttpServletRequest request;
    protected ServletContext app;
    private Set<String> scriptsFiles = new LinkedHashSet<String>();
    private Set<String> styleFiles = new LinkedHashSet<String>();

    public String getBaseUrl(){
//        if(baseUrl == null){
//
//            System.out.println(request.getQueryString());
//            System.out.println(request.getHeaderNames());
//            System.out.println(request.getRequestURI());///slsxpt/admin/index.action
//            System.out.println(request.getRequestURL());//http://localhost:8080/slsxpt/admin/index.action
//            System.out.println(request.getPathInfo());
//            System.out.println(request.getMethod());//GET
//        }
        //pageContext.request.contextPath
        return request.getContextPath();
    }


    private String actionName;

    public String getActionName() {
        return actionName;
    }

    public String getScriptsHtml() {
        StringBuilder sb = new StringBuilder();
        for(Iterator<String> iterator = scriptsFiles.iterator();iterator.hasNext();){
            sb.append("<script src='"+iterator.next()+"'></script>");
        }
        return sb.toString();
    }
    public String getStylesHtml(){
        StringBuilder sb = new StringBuilder();
        for(Iterator<String> iterator = styleFiles.iterator();iterator.hasNext();){
            sb.append("<link rel='stylesheet' href='"+iterator.next()+"'/>");
        }
        return sb.toString();
    }

    public BaseAction() {
//        ActionContext.getContext().getParameters().put("_this",this);
        request = ServletActionContext.getRequest();
        response = ServletActionContext.getResponse();
        app = ServletActionContext.getServletContext();

        request.setAttribute("_this",this);

        String simpleName = this.getClass().getSimpleName();
        actionName = simpleName.substring(0,simpleName.indexOf("Action")).toLowerCase();
        //System.out.println(actionName);
    }

    public BaseAction getThat(){
        return this;
    }

    public void registScript(String file){
        String assetsPath = (String) ServletActionContext.getServletContext().getAttribute("assets");
        scriptsFiles.add(assetsPath+"/"+file);
    }

    public void registStyle(String file){
        String assetsPath = (String) ServletActionContext.getServletContext().getAttribute("assets");
        styleFiles.add(assetsPath+"/"+file);
    }

    public Set<String> getScriptsFiles() {
        return scriptsFiles;
    }

//    @Override
//    public void setServletResponse(HttpServletResponse response) {
//        this.response = response;
//    }
//
//    @Override
//    public void setServletRequest(HttpServletRequest request) {
//        this.request = request;
//    }

    public void responceJson(Object dataJson){
        String data = null;

        try {
            data = JSONUtil.serialize(dataJson);
            response.setContentType("application/json;charset=UTF-8");
            response.getWriter().print(data);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public BaseAction getAction(){
        return this;
    }
}
