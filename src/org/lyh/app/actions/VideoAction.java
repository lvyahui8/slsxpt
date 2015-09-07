package org.lyh.app.actions;

import com.opensymphony.xwork2.ModelDriven;
import org.lyh.app.actions.admin.ProjectAction;
import org.lyh.app.base.BaseAction;
import org.lyh.app.entitys.ProjectEntity;
import org.lyh.app.services.VideoService;

/**
 * Created by lvyahui on 15-7-5.
 */
public class VideoAction extends ProjectAction {
    private VideoService videoService;

    public void setVideoService(VideoService videoService) {
        this.videoService = videoService;
    }
}
