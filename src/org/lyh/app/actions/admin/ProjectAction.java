package org.lyh.app.actions.admin;

import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import ognl.Ognl;
import org.lyh.app.base.BaseAction;
import org.lyh.app.base.paging.PageData;
import org.lyh.app.entitys.ProjectEntity;
import org.lyh.app.services.ProjectService;
import org.w3c.dom.stylesheets.LinkStyle;

import java.util.IdentityHashMap;
import java.util.List;

/**
 * Created by admin on 2015/7/1.
 */
public class ProjectAction extends BaseAction implements ModelDriven<ProjectEntity> {

    protected ProjectService projectService ;

    public void setProjectService(ProjectService projectService) {
        this.projectService = projectService;
    }

    protected ProjectEntity projectEntity = new ProjectEntity();

    @Override
    public ProjectEntity getModel() {
        return projectEntity;
    }

    public String save(){
        if(projectEntity.getId()!= null){
            ProjectEntity project = this.projectService.get(projectEntity.getId());
            if(project != null){
                this.tranProject(project);
                ActionContext.getContext().getValueStack().set("project",project);
            }
        }
        return SUCCESS;
    }

    private Integer currentPage ;

    public void setCurrentPage(Integer currentPage) {
        this.currentPage = currentPage;
    }

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

    public void tranProject(ProjectEntity project){
    }

    public String delete(){
        if(projectEntity.getId() != null){
            projectService.deleteProject(projectEntity);
        }
        return "r-"+getActionName()+"-list";
    }

    public String postSave(){
        if(projectEntity.getId()!=null){
            this.projectService.update(projectEntity);
        }else{
            this.projectService.add(projectEntity);
        }
        return "r-"+getActionName()+"-list";
    }
}
