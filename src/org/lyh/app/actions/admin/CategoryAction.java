package org.lyh.app.actions.admin;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.lyh.app.base.BaseAction;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.services.CategoryService;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by lvyahui on 2015-06-29.
 */
public class CategoryAction extends BaseAction implements ModelDriven<CategoryEntity>{
    private CategoryService categoryService ;

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    private CategoryEntity categoryEntity = new CategoryEntity();
    @Override
    public CategoryEntity getModel() {
        return this.categoryEntity;
    }

    private String categorysJson;

    private Integer parent_id;

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    public void setCategorysJson(String categorysJson) {
        this.categorysJson = categorysJson;
    }

    public String list(){
        if(ActionContext.getContext().getSession().get("topCategorys") == null){
            List<CategoryEntity> topCategorys = categoryService.getTopCategorys();
            request.getSession().setAttribute("topCategorys", topCategorys);
        }
        return SUCCESS;
    }

    public String postUpdateTree(){
        if(categorysJson != null){
            categoryService.updateCategorysTree(categorysJson);
        }
        return "r-category-list";
    }

    public String postUpdate(){
        categoryService.updateCategory(categoryEntity);
        return "r-category-list";
    }
    public String postAdd(){
        categoryService.addCategory(categoryEntity,parent_id);
        return "r-category-list";
    }

    public String postDelete(){
        categoryService.deleteCategory(categoryEntity);
        return "r-category-list";
    }

}
