package org.lyh.app.services;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.lyh.app.base.BaseService;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.daos.CategoryDao;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-22.
 */

@Service
@Transactional
public class CategoryService extends BaseService<CategoryEntity>{
    private CategoryDao categoryDao;

    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }

    public List<CategoryEntity> getTopCategorys() {
        return categoryDao.getTopCategorys();
    }

    public void updateCategorysTree(String categorysJson) {
        try {
//            System.out.println(categorysJson);
            Object obj = JSONUtil.deserialize(categorysJson);
//            System.out.println(obj);

            List<Map<String,Object>> categoryTree = (List<Map<String,Object>>)obj;
            updateCategoryTree(categoryTree,null,CategoryEntity.ROOT_LEVEL);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    private void updateCategoryTree(List<Map<String,Object>> categoryTree,
                                    CategoryEntity parentCategory,Integer level){
        if(categoryTree == null) return;
        for (
                Iterator<Map<String,Object>> it = categoryTree.iterator();
                it.hasNext();) {
            Map<String,Object> topItem = it.next();
            CategoryEntity nTopCategory = categoryDao.get(((Long) topItem.get("id")).intValue());
            System.out.println(nTopCategory);
            if((nTopCategory.getParent() != null && parentCategory ==null)
                    || (nTopCategory.getParent() == null && parentCategory != null)
                    || !(nTopCategory == null && parentCategory == null)
                    || !(nTopCategory.getParent().equals(parentCategory))
                    ){
                nTopCategory.setParent(parentCategory);
                nTopCategory.setLevel(level);
                categoryDao.save(nTopCategory);
            }
            updateCategoryTree((List<Map<String, Object>>) topItem.get("children"),nTopCategory,level+1);
        }
    }

    public void addCategory(CategoryEntity categoryEntity, Integer parent_id) {
        CategoryEntity parentCategory = categoryDao.get(parent_id);
        categoryEntity.setParent(parentCategory);
        categoryEntity.setLevel(parentCategory == null ? CategoryEntity.ROOT_LEVEL : parentCategory.getLevel()+1);
        categoryDao.update(categoryEntity);
    }

    public void deleteCategory(CategoryEntity categoryEntity) {
        categoryEntity = categoryDao.get(categoryEntity.getId());
//        System.out.println(categoryEntity);
        //把所有以它作为父栏目的栏目的父栏目为它的父栏目
        if(categoryEntity.getChildrens().size() > 0){
            for (Iterator<CategoryEntity> iterator = categoryEntity.getChildrens().iterator();
                 iterator.hasNext();){
                CategoryEntity children = iterator.next();
                children.setParent(categoryEntity.getParent());
                categoryDao.save(children);
            }
        }
        categoryDao.delete(categoryEntity);
    }

    public void updateCategory(CategoryEntity categoryEntity) {
        CategoryEntity thatCategory = categoryDao.get(categoryEntity.getId());
        if(!categoryEntity.equals(thatCategory)){
            thatCategory.setName(categoryEntity.getName());
            thatCategory.setType(categoryEntity.getType());
            categoryDao.save(thatCategory);
        }
    }
}
