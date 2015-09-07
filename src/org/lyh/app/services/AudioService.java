package org.lyh.app.services;

import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.ProjectEntity;

/**
 * Created by admin on 2015/7/12.
 */
public class AudioService extends ProjectService {
    @Override
    public void update(ProjectEntity audio) {
        ProjectEntity exsitAudio = projectDao.get(audio.getId());
        exsitAudio.setTitle(audio.getTitle());
        exsitAudio.setContent(audio.getContent());
        exsitAudio.setResourceUrl(audio.getResourceUrl());
        if(exsitAudio.getCategory().getId() != audio.getCategory_id()){
            CategoryEntity newCategory = categoryDao.get(audio.getCategory_id());
            if(newCategory!=null){
                exsitAudio.setCategory(newCategory);
            }
        }
        projectDao.save(exsitAudio);
    }

    @Override
    public void add(ProjectEntity audio) {
        CategoryEntity category = categoryDao.get(audio.getCategory_id());
        if(category!=null){
            audio.setType("audio");
            audio.setCategory(category);
            projectDao.save(audio);
        }
    }
}
