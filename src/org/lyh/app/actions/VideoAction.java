package org.lyh.app.actions;

import org.lyh.app.entitys.VideoEntity;
import org.lyh.app.services.VideoService;
import org.lyh.library.paging.PageData;

/**
 * Created by lvyahui on 15-7-5.
 */
public class VideoAction extends ProjectAction<VideoEntity> {
    @Override
    public String list() {
        PageData<VideoEntity> pageData = new PageData<>();
        if(currentPage != null){
            pageData.setCurrentPage(currentPage);
        }
        pageData = ((VideoService)this.baseService).getByCategoryId(pageData,this.entity.getCategoryId());
        bindData("pageData", pageData);
        return SUCCESS;
    }
}
