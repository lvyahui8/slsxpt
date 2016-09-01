package org.lyh.app.services;

import org.lyh.app.daos.VideoQstDao;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.VideoQstEntity;
import org.lyh.app.entitys.VideoEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by admin on 2015/7/3.
 */
@Service
@Transactional
public class VideoService extends ProjectService<VideoEntity> {

    protected VideoQstDao videoQstDao ;

    public void setVideoQstDao(VideoQstDao videoQstDao) {
        this.videoQstDao = videoQstDao;
    }

    @Override
    public Integer add(VideoEntity video) {
        System.out.println(video);
        CategoryEntity category = this.categoryDao.get(video.getCategoryId());
        video.setCategory(category);
        video.setUser(getLoginUser());

        // 这里使用hibernate自动的级联，但是当ProjectQstEntity@getVideo注解为insert = false,update = false时就会失败
        for(VideoQstEntity vq : video.getQuestions()){
            vq.setVideo(video);
        }
        Integer video_id = this.baseDao.save(video);
        /*
        * 下面的代码也可以，但是先执行多条insert之后，还执行了多余的update语句
         */
        /*
        Integer video_id = this.baseDao.save(video);
        for(VideoQstEntity vq : video.getQuestions()){
            vq.setProjectId(video_id);
            vq.setType("video");
            this.videoQstDao.save(vq);
        }
        */
        return video_id;
    }

    @Override
    public void update(VideoEntity video) {
        VideoEntity existVideo = this.baseDao.get(video.getId());
        existVideo.setTitle(video.getTitle());
        existVideo.setContent(video.getContent());
        existVideo.setThumbnail(video.getThumbnail());

        this.videoQstDao.delete("video_id",video.getId());
        for (VideoQstEntity videoQstEntity : video.getQuestions()){
            videoQstEntity.setVideo(existVideo);
            existVideo.getQuestions().add(videoQstEntity);
        }

        if(existVideo.getCategory().getId().equals(video.getCategoryId())){
            CategoryEntity category = this.categoryDao.get(video.getCategoryId());
            existVideo.setCategory(category);
        }
        this.baseDao.update(existVideo);
    }

    @Override
    public boolean delete(VideoEntity entity) {
        // 会无法删除，因为注解的是延迟加载，所以这里手动删除，并且这里直接按video_id删除，效率更高
        this.videoQstDao.deleteByVideoId(entity.getId());
        this.baseDao.delete(entity);
        return true;
    }
}
