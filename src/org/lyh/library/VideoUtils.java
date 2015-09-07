package org.lyh.library;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2015/7/15.
 */
public class VideoUtils {
    public static final String FFMPEG_EXECUTOR = "C:/Software/ffmpeg.exe";
    public static final int THUMBNAIL_WIDTH = 400;
    public static final int THUMBNAIL_HEIGHT = 300;

    public static boolean extractThumbnail(File inputFile,String thumbnailOutput){
        List<String> command = new ArrayList<String>();
        File ffmpegExe = new File(FFMPEG_EXECUTOR);
        if(!ffmpegExe.exists()){
            System.out.println("转码工具不存在");
            return false;
        }

        System.out.println(ffmpegExe.getAbsolutePath());
        System.out.println(inputFile.getAbsolutePath());
        command.add(ffmpegExe.getAbsolutePath());
        command.add("-i");
        command.add(inputFile.getAbsolutePath());
        command.add("-y");
        command.add("-f");
        command.add("image2");
        command.add("-ss");
        command.add("10");
        command.add("-t");
        command.add("0.001");
        command.add("-s");
        command.add(THUMBNAIL_WIDTH+"*"+THUMBNAIL_HEIGHT);
        command.add(thumbnailOutput);

        ProcessBuilder builder = new ProcessBuilder();
        builder.command(command);
        builder.redirectErrorStream(true);
        try {
            long startTime = System.currentTimeMillis();
            Process process = builder.start();
            System.out.println("启动耗时"+(System.currentTimeMillis()-startTime));
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

}
