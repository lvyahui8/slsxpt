package org.lyh.app.services;

import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.ProjectEntity;
import org.lyh.library.SiteHelpers;

/**
 * Created by admin on 2015/7/3.
 */
public class ArticleService extends ProjectService {

    public void add(ProjectEntity article) {
        CategoryEntity category = this.categoryDao.get(article.getCategory_id());
        article.setType("article");
        String description = SiteHelpers.html2text(article.getContent());
        description = description.length() > 40 ? description.substring(0,40) : description;
        article.setDescription(description);
        article.setCategory(category);
        this.projectDao.save(article);
    }

    public void update(ProjectEntity article) {
        ProjectEntity existArticle = this.projectDao.get(article.getId());
        existArticle.setTitle(article.getTitle());
        existArticle.setContent(article.getContent());
        String description = SiteHelpers.html2text(article.getContent());
        description = description.length() > 40 ? description.substring(0,40) : description;
        article.setDescription(description);
        if(existArticle.getCategory().getId() != article.getCategory_id()){
            CategoryEntity newCategory =  categoryDao.get(article.getCategory_id());
            existArticle.setCategory(newCategory);
        }
        this.projectDao.save(existArticle);
    }
}
