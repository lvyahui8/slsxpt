package org.lyh.app.services;

import org.lyh.app.entitys.ArticleEntity;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.library.SiteHelpers;

/**
 * Created by admin on 2015/7/3.
 */
public class ArticleService extends ProjectService<ArticleEntity> {

    @Override
    public Integer add(ArticleEntity article) {
        CategoryEntity category = this.categoryDao.get(article.getCategoryId());
        String description = SiteHelpers.html2text(article.getContent());
        description = description.length() > 40 ? description.substring(0,40) : description;
        article.setDescription(description);
        article.setCategory(category);
        article.setUser(getLoginUser());
        return this.baseDao.save(article);
    }

    @Override
    public void update(ArticleEntity article) {
        ArticleEntity existArticle = this.baseDao.get(article.getId());
        existArticle.setTitle(article.getTitle());
        existArticle.setContent(article.getContent());

        String description = SiteHelpers.html2text(article.getContent());

        description = description.length() > 40 ? description.substring(0,40) : description;
        existArticle.setDescription(description);

        if(existArticle.getCategory().getId().equals(article.getCategoryId())){
            CategoryEntity newCategory =  categoryDao.get(article.getCategoryId());
            existArticle.setCategory(newCategory);
        }
        this.baseDao.save(existArticle);
    }
}
