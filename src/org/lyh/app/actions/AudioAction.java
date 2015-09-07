package org.lyh.app.actions;

import org.lyh.app.actions.admin.ProjectAction;
import org.lyh.app.services.AudioService;

/**
 * Created by admin on 2015/7/12.
 */
public class AudioAction extends ProjectAction{
    private AudioService audioService;

    public void setAudioService(AudioService audioService) {
        this.audioService = audioService;
    }
}
