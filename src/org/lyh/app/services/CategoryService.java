package org.lyh.app.services;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.lyh.app.daos.QstTplDao;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.daos.CategoryDao;
import org.lyh.app.entitys.QstTplEntity;
import org.lyh.app.entitys.QstTplItemEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * Created by lvyahui on 2015-06-22.
 */

@Service
@Transactional
public class CategoryService extends BaseService<CategoryEntity>{

    private QstTplDao qstTplDao ;

    public void setQstTplDao(QstTplDao qstTplDao) {
        this.qstTplDao = qstTplDao;
    }

    public List<CategoryEntity> getTopCategorys() {
        return ((CategoryDao)baseDao).getTopCategorys();
    }

    public void updateCategoryTree(String categorysJson) {
        try {
            Object obj = JSONUtil.deserialize(categorysJson);

            List<Map<String,Object>> categoryTree = (List<Map<String,Object>>)obj;
            updateCategoryTree(categoryTree,null,CategoryEntity.ROOT_LEVEL);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    /**
     * 更新菜单树
     * @param categoryTree 菜单树
     * @param parentCategory 根节点
     * @param level 等级
     */
    private void updateCategoryTree(List<Map<String,Object>> categoryTree,
                                    CategoryEntity parentCategory,Integer level){
        if(categoryTree == null) return;

        for (
                Iterator<Map<String,Object>> it = categoryTree.iterator();
                it.hasNext();) {
            Map<String,Object> topItem = it.next();
            CategoryEntity nTopCategory = baseDao.get(((Long) topItem.get("id")).intValue());

            /*
             * // 父节点或者级别发生变化
             */
            /*
            if((nTopCategory.getParent() != null && parentCategory == null)
                    || (nTopCategory.getParent() == null && parentCategory != null)
                    || !(nTopCategory == null && parentCategory == null)
                    || !(nTopCategory.getParent().equals(parentCategory))
                    ){

            }
            */
            nTopCategory.setParent(parentCategory);
            nTopCategory.setLevel(level);
            baseDao.save(nTopCategory);
            updateCategoryTree((List<Map<String, Object>>) topItem.get("children"),nTopCategory,level+1);
        }
    }

    @Override
    public Integer add(CategoryEntity categoryEntity) {
        if(categoryEntity.getParentId() != null){
            CategoryEntity parentCategory = baseDao.get(categoryEntity.getParentId());
            categoryEntity.setParent(parentCategory);
            categoryEntity.setLevel(parentCategory.getLevel()+1);
        }
        else{
            categoryEntity.setLevel(CategoryEntity.ROOT_LEVEL);
        }
        return baseDao.save(categoryEntity);
    }

    @Override
    public boolean delete(CategoryEntity categoryEntity) {
        categoryEntity = baseDao.get(categoryEntity.getId());
//        System.out.println(categoryEntity);
        //把所有以它作为父栏目的栏目的父栏目为它的父栏目
        if(categoryEntity.getChildrens().size() > 0){
            for (Iterator<CategoryEntity> iterator = categoryEntity.getChildrens().iterator();
                 iterator.hasNext();){
                CategoryEntity children = iterator.next();
                children.setParent(categoryEntity.getParent());
                baseDao.save(children);
            }
        }
        baseDao.delete(categoryEntity);
        return true;
    }

    @Override
    public void update(CategoryEntity category) {
        CategoryEntity existCategory = baseDao.get(category.getId());
        if(!category.equals(existCategory)){
            existCategory.setName(category.getName());
            existCategory.setType(category.getType());
            if(existCategory.getQstTplId() != null
                    ? !existCategory.getQstTplId().equals(category.getQstTplId()) : category.getQstTplId() != null){
                existCategory.setTemplate(this.qstTplDao.get(category.getQstTplId()));
            }
            baseDao.save(existCategory);
        }
    }


    public List<QstTplEntity> allTemplate(){
        return this.qstTplDao.all();
    }

    public List<QstTplItemEntity> getTemplate(Integer id){
        QstTplEntity template = this.qstTplDao.get(id);
        System.out.println(template);
        if(template != null){
            return template.getItems();
        }
        return null;
    }


}
