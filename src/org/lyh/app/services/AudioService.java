package org.lyh.app.services;

import org.lyh.app.daos.AudioQstDao;
import org.lyh.app.entitys.AudioEntity;
import org.lyh.app.entitys.AudioQstEntity;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.ProjectEntity;

import java.io.Serializable;

/**
 * Created by admin on 2015/7/12.
 */
public class AudioService extends ProjectService<AudioEntity> {

    private AudioQstDao audioQstDao;

    public void setAudioQstDao(AudioQstDao audioQstDao) {
        this.audioQstDao = audioQstDao;
    }

    @Override
    public void update(AudioEntity audio) {
        AudioEntity exsitAudio = baseDao.get(audio.getId());
        exsitAudio.setTitle(audio.getTitle());
        exsitAudio.setContent(audio.getContent());
        exsitAudio.setResourceUrl(audio.getResourceUrl());
        if(exsitAudio.getCategory().getId() != audio.getCategoryId()){
            CategoryEntity newCategory = categoryDao.get(audio.getCategoryId());
            if(newCategory!=null){
                exsitAudio.setCategory(newCategory);
            }
        }
        this.audioQstDao.delete("audio_id", audio.getId());
        for (AudioQstEntity audioQstEntity : audio.getQuestions()){
            audioQstEntity.setAudio(exsitAudio);
            exsitAudio.getQuestions().add(audioQstEntity);
        }
        baseDao.save(exsitAudio);
    }


    @Override
    public Integer add(AudioEntity audio) {
        CategoryEntity category = categoryDao.get(audio.getCategoryId());
        if(category!=null){
            audio.setCategory(category);
            audio.setUser(getLoginUser());
            for (AudioQstEntity audioQstEntity : audio.getQuestions()){
                audioQstEntity.setAudio(audio);
            }
            return baseDao.save(audio);
        }else{
            return -1;
        }
    }

    @Override
    public boolean delete(AudioEntity entity) {
        this.audioQstDao.delete("audio_id",entity.getId());
        this.baseDao.delete(entity);
        return true;
    }
}
