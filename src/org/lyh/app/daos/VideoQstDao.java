package org.lyh.app.daos;

import org.lyh.app.entitys.VideoQstEntity;

/**
 * Created by Administrator on 2015/10/4.
 */
public class VideoQstDao extends BaseDao<VideoQstEntity> {
    public boolean deleteByVideoId(Integer videoId){
        return this.delete("video_id",videoId);
    }
}
