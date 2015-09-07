package org.lyh.app.services;

import org.lyh.app.base.BaseService;
import org.lyh.app.base.paging.PageData;
import org.lyh.app.daos.CategoryDao;
import org.lyh.app.daos.ProjectDao;
import org.lyh.app.entitys.ProjectEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2015/7/1.
 */
@Service
@Transactional
public class ProjectService extends BaseService<ProjectEntity> {
    protected ProjectDao projectDao;

    public void setProjectDao(ProjectDao projectDao) {
        this.projectDao = projectDao;
    }

    protected CategoryDao categoryDao;

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }


    public ProjectEntity get(Integer id) {
        return this.projectDao.get(id);
    }

    public List<ProjectEntity> getProjects(String type,Integer currentPage, Integer pageSize) {
        Map<String,Object> attributes = new HashMap<String,Object>();
        attributes.put("type",type);
        return this.projectDao.findByPage(attributes, currentPage, pageSize);
    }

    public PageData<ProjectEntity> getProjects(String type,PageData<ProjectEntity> pageData){
        Map<String,Object> attributes = new HashMap<String,Object>();
        attributes.put("type",type);
        return this.projectDao.findByPage(attributes,pageData, "createdAt");
    }


    public void deleteProject(ProjectEntity projectEntity) {
        ProjectEntity  existProject = this.projectDao.get(projectEntity.getId());
        if(existProject != null){
            this.projectDao.delete(existProject);
        }
    }

    public void update(ProjectEntity projectEntity){

    }

    public void add(ProjectEntity projectEntity){

    }
}
