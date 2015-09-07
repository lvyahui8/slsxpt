package org.lyh.app.actions;

import com.opensymphony.xwork2.ModelDriven;
import org.lyh.app.actions.admin.ProjectAction;
import org.lyh.app.base.BaseAction;
import org.lyh.app.entitys.ProjectEntity;
import org.lyh.app.services.ArticleService;

/**
 * Created by lvyahui on 15-7-5.
 */
public class ArticleAction  extends ProjectAction{
    private ArticleService articleService;

    public void setArticleService(ArticleService articleService) {
        this.articleService = articleService;
    }
}
