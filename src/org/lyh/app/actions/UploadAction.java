package org.lyh.app.actions;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.lyh.app.entitys.UserEntity;
import org.lyh.library.SiteHelpers;
import org.lyh.library.VideoUtils;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by admin on 2015/7/2.
 */
public class UploadAction extends BaseAction<UserEntity>{
    private String saveBasePath;
    private String imagePath;
    private String videoPath;
    private String audioPath;
    private String thumbnailPath;

    private File image;
    public void setImage(File image) {
        this.image = image;
    }

    private String filename;

    public void setFilename(String filename) {
        this.filename = filename;
    }

    private File picture;
    private String pictureFileName;
    private String pictureContentType;

    private File file;
    private String fileFileName;
    private String fileContentType;

    public void setThumbnailPath(String thumbnailPath) {
        this.thumbnailPath = thumbnailPath;
    }

    public void setSaveBasePath(String saveBasePath) {
        this.saveBasePath = saveBasePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public void setAudioPath(String audioPath) {
        this.audioPath = audioPath;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

    public String getFileFileName() {
        return fileFileName;
    }

    public void setFileFileName(String fileFileName) {
        this.fileFileName = fileFileName;
    }

    public String getFileContentType() {
        return fileContentType;
    }

    public void setFileContentType(String fileContentType) {
        this.fileContentType = fileContentType;
    }

    public void setPicture(File picture) {
        this.picture = picture;
    }

    public void setPictureFileName(String pictureFileName) {
        this.pictureFileName = pictureFileName;
    }

    public void setPictureContentType(String pictureContentType) {
        this.pictureContentType = pictureContentType;
    }

    public String image(){
        SiteHelpers.p("上传图片:"+pictureFileName);
        Map<String,Object> dataJson = new HashMap<>();
        if(picture != null){
            String fileExtend = pictureFileName.substring(pictureFileName.lastIndexOf("."));
            String newFileName
                    = SiteHelpers.md5(pictureFileName+picture.getTotalSpace()) + fileExtend;
            System.out.println(newFileName);
//            if(pictureContentType.startsWith("image")){
//                savePath = "/upload/image";
//            }
            String realPath = ServletActionContext.getServletContext().getRealPath(saveBasePath+imagePath);
            File saveFile = new File(realPath,newFileName);
            if(!saveFile.exists()){
                if(!saveFile.getParentFile().exists()){
                    saveFile.getParentFile().mkdirs();
                }
                try {
                    FileUtils.copyFile(picture,saveFile);
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            dataJson.put("image_url",
                    ServletActionContext
                            .getServletContext().getContextPath()+saveBasePath+imagePath+"/"+newFileName);
            dataJson.put("success",true);
        }
        else{
            dataJson.put("success",false);
        }

        this.responceJson(dataJson);

        return NONE;
    }

    @Override
    public String execute() throws Exception {
        return super.execute();
    }

    public String video() {
        Map<String, Object> dataJson = new HashMap<String, Object>();
        System.out.println(file);
        System.out.println(fileFileName);
        System.out.println(fileContentType);
        String fileExtend = fileFileName.substring(fileFileName.lastIndexOf("."));
        String newFileName = SiteHelpers.md5(fileFileName + file.getTotalSpace());
        String typeDir = "normal";
        String thumbnailName = null,thumbnailFile = null;
        boolean needThumb = false,extractOk = false;
        if (fileContentType.contains("video")) {
            typeDir = videoPath;
            // 提取缩量图
            needThumb = true;
            thumbnailName = newFileName + ".jpg";
            thumbnailFile
                    = app.getRealPath(saveBasePath + thumbnailPath) + "/" + thumbnailName;
        }

        String realPath = app.getRealPath(saveBasePath + typeDir);
        File saveFile = new File(realPath, newFileName + fileExtend);
        // 存在同名文件，跳过
        if (!saveFile.exists()) {
            if (!saveFile.getParentFile().exists()) {
                saveFile.getParentFile().mkdirs();
            }
            try {
                FileUtils.copyFile(file, saveFile);
                if(needThumb){
                    extractOk = VideoUtils.extractThumbnail(saveFile, thumbnailFile);
                    System.out.println("提取缩略图成功:"+extractOk);
                }
                dataJson.put("success", true);
            } catch (IOException e) {
                System.out.println(e.getMessage());
                dataJson.put("success", false);
            }
        }else{
            dataJson.put("success", true);
        }
        if((Boolean)dataJson.get("success")){
            dataJson.put("link",
                    app.getContextPath() +  saveBasePath + typeDir + "/" + newFileName + fileExtend);
            if(needThumb){
                dataJson.put("thumbnail",
                        app.getContextPath() + saveBasePath + thumbnailPath + "/" + thumbnailName);
            }
        }
        this.responceJson(dataJson);
        return NONE;
    }


    public String save() {
        Map<String, Object> dataJson = new HashMap<String, Object>();
        String  fileExtend = fileFileName.substring(fileFileName.lastIndexOf(".")),
                newFileName = SiteHelpers.md5(fileFileName + file.getTotalSpace()),
                typeDir = "normal",
                thumbnailName = null,
                thumbnailFile = null;
        boolean needThumb = false,extractOk = false;
        if (fileContentType.contains("video")) {
            typeDir = videoPath;
            // 提取缩量图
            needThumb = true;
            thumbnailName = newFileName + ".jpg";
            thumbnailFile
                    = app.getRealPath(saveBasePath + thumbnailPath) + "/" + thumbnailName;
        }else if(fileContentType.contains("image")){
            typeDir = imagePath;
        }else if(fileContentType.contains("audio")){
            typeDir = audioPath;
        }
        String realPath = app.getRealPath(saveBasePath + typeDir);
        File saveFile = new File(realPath, newFileName + fileExtend);
        // 存在同名文件，跳过
        if (!saveFile.exists()) {
            if (!saveFile.getParentFile().exists()) {
                saveFile.getParentFile().mkdirs();
            }
            try {
                FileUtils.copyFile(file, saveFile);
                if(needThumb){
                    extractOk = VideoUtils.extractThumbnail(saveFile, thumbnailFile);
                    //System.out.println("提取缩略图成功:"+extractOk);
                }
                dataJson.put("success", true);
            } catch (IOException e) {
                System.out.println(e.getMessage());
                dataJson.put("success", false);
            }
        }else{
            dataJson.put("success", true);
        }
        if((Boolean)dataJson.get("success")){
            dataJson.put("link",
                    app.getContextPath() +saveBasePath + typeDir + "/" + newFileName + fileExtend);
            if(needThumb){
                dataJson.put("thumbnail",
                        app.getContextPath() + saveBasePath + thumbnailPath + "/" + thumbnailName);
            }
        }
        this.responceJson(dataJson);
        return NONE;
    }
}
