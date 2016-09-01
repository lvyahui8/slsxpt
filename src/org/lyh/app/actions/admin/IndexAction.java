package org.lyh.app.actions.admin;

import com.opensymphony.xwork2.ActionContext;
import org.lyh.app.actions.BaseAction;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.UserEntity;
import org.lyh.app.services.CategoryService;

import java.util.List;

/**
 * Created by lvyahui on 2015-06-18.
 */
public class IndexAction extends BaseAction<UserEntity> {
    private CategoryService categoryService;

    public void setCategoryService(CategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Override
    public String execute() throws Exception {
        if(ActionContext.getContext().getSession().get("topCategorys") == null){
            List<CategoryEntity> topCategorys = categoryService.getTopCategorys();
            request.getSession().setAttribute("topCategorys", topCategorys);
        }
        return super.execute();
    }
}
