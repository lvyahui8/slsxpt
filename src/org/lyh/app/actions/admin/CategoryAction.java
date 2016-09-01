package org.lyh.app.actions.admin;

import org.lyh.app.actions.BaseAction;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.QstTplItemEntity;
import org.lyh.app.services.CategoryService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-29.
 * 栏目
 */
public class CategoryAction extends BaseAction<CategoryEntity> {

    private String categorysJson;

    public void setCategorysJson(String categorysJson) {
        this.categorysJson = categorysJson;
    }

    @Override
    public String list() {
        request.getSession().setAttribute("topCategorys",
                ((CategoryService) baseService).getTopCategorys());
        this.bindData("allTemplate", ((CategoryService) baseService).allTemplate());
        return SUCCESS;
    }

    public String postUpdateTree() {
        if (categorysJson != null) {
            ((CategoryService) baseService).updateCategoryTree(categorysJson);
        }
        return "r-category-list";
    }

    public String template(){
        Map<String,Object> dataJson = new HashMap<>();
        System.out.println(entity);
        List<QstTplItemEntity> items = ((CategoryService)baseService).getTemplate(entity.getQstTplId());
        boolean success = false;
        if(items != null && items.size() > 0){
            success = true;
            dataJson.put("items",items);
        }
        else{

        }
        dataJson.put("success",success);
        dataJson.put("qstTplId",entity.getQstTplId());
        this.responceJson(dataJson);
        return NONE;
    }
}
