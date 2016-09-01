package org.lyh.app.services;

import org.lyh.app.daos.ExamDao;
import org.lyh.app.entitys.BaseEntity;
import org.lyh.app.daos.CategoryDao;
import org.lyh.app.entitys.ProjectEntity;
import org.lyh.library.paging.PageData;

import java.util.HashMap;
import java.util.Map;


/**
 * Created by admin on 2015/7/1.
 */
public class ProjectService<T extends ProjectEntity> extends BaseService<T> {
    protected CategoryDao categoryDao;

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    public PageData<T> getByCategoryId(PageData<T> pageData,Integer categoryId){
        Map<String,Object> condition = new HashMap<>();
        System.out.println("categoryId:"+categoryId);
        condition.put("category", categoryDao.get(categoryId));
        return this.getDatas(pageData,condition);
    }

    @Override
    public void handleEntity(T existEntity) {
        existEntity.setPrev(baseDao.prev(existEntity));
        existEntity.setNext(baseDao.next(existEntity));
    }

}
