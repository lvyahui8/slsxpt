package org.lyh.app.services;

import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.ProjectEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import javax.xml.bind.SchemaOutputResolver;

/**
 * Created by admin on 2015/7/3.
 */
@Service
@Transactional
public class VideoService extends ProjectService {

    @Override
    public void add(ProjectEntity projectEntity) {
        CategoryEntity category = this.categoryDao.get(projectEntity.getCategory_id());
        projectEntity.setCategory(category);
        projectEntity.setType("video");
        this.projectDao.save(projectEntity);
    }

    @Override
    public void update(ProjectEntity projectEntity) {
        ProjectEntity existVideo = this.projectDao.get(projectEntity.getId());
        existVideo.setTitle(projectEntity.getTitle());
        existVideo.setContent(projectEntity.getContent());
        existVideo.setThumbnail(projectEntity.getThumbnail());

        if(existVideo.getCategory().getId()  != projectEntity.getCategory_id()){
            CategoryEntity category = this.categoryDao.get(projectEntity.getCategory_id());
            existVideo.setCategory(category);
        }
    }
}
