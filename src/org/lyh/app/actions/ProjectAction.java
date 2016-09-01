package org.lyh.app.actions;

import org.lyh.app.actions.BaseAction;
import org.lyh.app.entitys.BaseEntity;
import org.lyh.app.entitys.ProjectEntity;
import org.lyh.app.services.CategoryService;
import org.lyh.library.paging.PageData;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2015/7/1.
 */
public class ProjectAction<T extends ProjectEntity> extends BaseAction<T> {

    private CategoryService categoryService;

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    //    public String save(){
//        /*
//        if(projectEntity.getId()!= null){
//            ProjectEntity project = this.projectService.get(projectEntity.getId());
//            if(project != null){
//                this.tranProject(project);
//                ActionContext.getContext().getValueStack().set("project",project);
//            }
//        }
//        */
//        return SUCCESS;
//    }
    /*
    public String list(){
        PageData<ProjectEntity> pageData = new PageData<>();
        if(currentPage != null){
            pageData.setCurrentPage(currentPage);
        }
        pageData = this.projectService.getProjects(getActionName(),pageData);
        if(pageData.getDatas() != null && pageData.getDatas().size() > 0){
            ActionContext.getContext().getValueStack().set("pageData",pageData);
        }
        return SUCCESS;
    }
    */
    /*
    @Override
    protected void beforeList(PageData<T> pageData) {
        List<T> items = pageData.getDatas();
        for (int i=0;i<items.size();i++){
            ProjectEntity project = items.get(i);
            if(i!=0){
                project.setPrev(items.get(i-1));
            }
            if(i!=items.size()-1){
                project.setNext(items.get(i+1));
            }
        }
    }
    */
    @Override
    protected Map<String, Object> listParam() {
        Map<String,Object> condition = new HashMap<>();
        if(entity.getCategoryId() != null){
            condition.put("category",categoryService.get(entity.getCategoryId()));
        }
        return condition;
    }
}
