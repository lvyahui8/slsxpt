package org.lyh.app.actions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.json.JSONUtil;
import org.lyh.app.entitys.BaseEntity;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.services.BaseService;
import org.lyh.library.SiteHelpers;
import org.lyh.library.paging.PageData;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.*;

/**
 * Created by lvyahui on 2015-06-17.
 */
public class BaseAction<T extends BaseEntity> extends ActionSupport implements ModelDriven<T>
//    implements ServletResponseAware,ServletRequestAware
{
    private Class <T> entityClass;//创建实体类

    private String entityName = null;
    protected T entity ;

    public T getModel() {
        return entity;
    }

    protected Integer currentPage ;//创建当前页面属性

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

    protected BaseService<T> baseService;

    public void setBaseService(BaseService<T> baseService) {
        this.baseService = baseService;
    }

    public final String JSON = "json";

    protected HttpServletResponse response;
    protected HttpServletRequest request;
    protected ServletContext app;
    private Set<String> scriptsFiles = new LinkedHashSet<String>();
    private Set<String> styleFiles = new LinkedHashSet<String>();



    public String getBaseUrl(){//获取当前的localhost:8080url地址

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


    private String actionName;//创建action的属性

    public String getActionName() {
        return actionName;
    }

    public String getScriptsHtml() {//获取需要的Script
        StringBuilder sb = new StringBuilder();
        for(Iterator<String> iterator = scriptsFiles.iterator();iterator.hasNext();){
            sb.append("<script src='"+iterator.next()+"'></script>");
        }
        return sb.toString();
    }
    public String getStylesHtml(){//获取当前所需要的样式
        StringBuilder sb = new StringBuilder();
        for(Iterator<String> iterator = styleFiles.iterator();iterator.hasNext();){
            sb.append("<link rel='stylesheet' href='"+iterator.next()+"'/>");
        }
        return sb.toString();
    }

    public BaseAction() {//基础action
//        ActionContext.getContext().getParameters().put("_this",this);
        request = ServletActionContext.getRequest();
        response = ServletActionContext.getResponse();
        app = ServletActionContext.getServletContext();

        request.setAttribute("_this",this);

        String simpleName = this.getClass().getSimpleName();
        String prefix = simpleName.substring(0,simpleName.indexOf("Action"));
        actionName = prefix.substring(0,1).toLowerCase()+ prefix.substring(1);
        //System.out.println(actionName);

        /*
         * 实例化实体对象
         */
        try {
            Type type = getClass().getGenericSuperclass();
            SiteHelpers.p("Action泛型:"+type);
            entityClass = (Class <T>) ((ParameterizedType) type).getActualTypeArguments()[0];
            Object object = entityClass.newInstance();
            entity = (T) object;
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        if(entityName == null){
            entityName = entity.getEntityName();
        }
    }

    public BaseAction getThat(){
        return this;
    }



    protected void tranProject(T existEntity) {

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
    }//获取js文件

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


    public String postSave(){
        SiteHelpers.p("postSave提交数据"+entity);
        if(entity.getId()!=null){
            this.baseService.update(entity);
        }else{
            this.baseService.add(entity);
        }
        return "r-"+getActionName()+"-list";
    }

    public String postDelete(){
        if(entity.getId() != null){
            baseService.delete(entity);
        }
        return "r-"+getActionName()+"-list";
    }

    public String delete(){
        if(entity.getId() != null){
            SiteHelpers.p("删除实体："+entity);
            baseService.delete(entity);
        }
        return "r-"+getActionName()+"-list";
    }

    public String save(){
        bindModal();
        return SUCCESS;
    }

    private void bindModal() {

        if(entity.getId()!= null){
            T existEntity = this.baseService.get(entity.getId());
            if(existEntity != null){
                this.beforeView(existEntity);
                SiteHelpers.p("编辑实体" + entity.getClass().getSimpleName() + ", ID:" + entity.getId() + ",实体内容：" + entity.toString());
                bindData(entityName, existEntity);
                bindData("entity",existEntity);
            }
        }
        else{
            bindData(entityName, entity);
            bindData("entity",entity);
        }
    }

    protected void beforeView(T existEntity) {
        this.baseService.handleEntity(existEntity);
    }

    public String list(){
        PageData<T> pageData = new PageData<>();
        pageData.setListUrl(getBaseUrl()+
                ServletActionContext.getActionMapping().getNamespace()+"/"+getActionName()+"-list.action");
        if(currentPage != null){
            pageData.setCurrentPage(currentPage);
        }
        Map<String,Object> condition = listParam();
        pageData = this.baseService.getDatas(pageData,condition);
        beforeList(pageData);
        if(pageData.getDatas() != null && pageData.getDatas().size() > 0){
            bindData("pageData",pageData);
            bindData(entityName+"s",pageData.getDatas());
        }
        return SUCCESS;
    }

    protected Map<String, Object> listParam() {
        return null;
    }

    /**
     * 交由子类覆写
     * @param pageData
     */
    protected void beforeList(PageData<T> pageData) {
    }

    public boolean bindData(String key, Object data){
        if(data != null){
            ActionContext.getContext().getValueStack().set(key,data);
            return true;
        }else{
            return false;
        }
    }


    public String categorySelector(String type,Integer value,String name,String hClass){
        StringBuilder sb = new StringBuilder("<select name='"+name+"' class='"+hClass+"'\n" +
                " data-validate=\"required\" data-message-required=\"必须选择栏目\">");
        ActionContext actionContext = ActionContext.getContext();
        Object sessionVal = actionContext.getSession().get("topCategorys");

        if(sessionVal != null){
            List<CategoryEntity> topCategorys = (List<CategoryEntity>) sessionVal;
            for(CategoryEntity topCategory : topCategorys){
                Stack<CategoryEntity> categoryStack = new Stack<>();
                categoryStack.push(topCategory);
                while(!categoryStack.empty()){
                    CategoryEntity category = categoryStack.pop();
                    if(type == null || category.getType().equals(type)){
                        sb.append("<option value='"
                                +category.getId()
                                +"' data-qstTplId='"
                                +(category.getQstTplId() != null
                                ? category.getQstTplId() : "")
                                +"'");
                        if(category.getId().equals(value)){
                            //bindData("selectedCategory",category.getId());
                            sb.append("selected");
                        }
                        sb.append(" >"+category.getName()+"</option>");
                    }
                    if(category.getChildrens().size() > 0){
                        for(CategoryEntity childCategory : category.getChildrens()){
                            categoryStack.push(childCategory);
                        }
                    }
                }
            }
        }
        sb.append("</select>");
        return sb.toString();
    }

    public String categorySelector(){
        return categorySelector(null, null, "categoryId", "selectboxit");
    }

    public String categorySelector(String type,Integer value){
        return categorySelector(type,value,"categoryId","selectboxit");
    }

    public BaseAction<T> getAction(){
        return this;
    }

    public String view(){
        bindModal();
        return SUCCESS;
    }
}
