package org.lyh.library;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2015/7/15.
 */
public class VideoUtils {
    public static final String FFMPEG_EXECUTOR = "ffmpeg";
    public static final int THUMBNAIL_WIDTH = 400;
    public static final int THUMBNAIL_HEIGHT = 300;

    public static boolean extractThumbnail(File inputFile,String thumbnailOutput){
        StringBuilder command = new StringBuilder();

        System.out.println(inputFile.getAbsolutePath());
        command.append(FFMPEG_EXECUTOR);
        command.append(" -i ");
        command.append(inputFile.getAbsolutePath());
        command.append(" -y -f image2 -ss 10 -t 0.001 -s ");
        command.append(THUMBNAIL_WIDTH+"*"+THUMBNAIL_HEIGHT+" ");
        command.append(thumbnailOutput);
        String cmd = command.toString();
        return runProccess(cmd);
    }

    private static boolean runProccess(String cmd) {
        System.out.println(cmd);
        ProcessBuilder builder = new ProcessBuilder("/bin/sh","-c",cmd);
//        builder.command(command);
        builder.redirectErrorStream(true);
        try {
            long startTime = System.currentTimeMillis();
            Process process = builder.start();
            System.out.println("delay"+(System.currentTimeMillis()-startTime));
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean extractThumbnailOld(File inputFile,String thumbnailOutput){
        List<String> command = new ArrayList<String>();
//        File ffmpegExe = new File(FFMPEG_EXECUTOR);
//        if(!ffmpegExe.exists()){
//            System.out.println("ffmpeg not supoort");
//            return false;
//        }

//        System.out.println(ffmpegExe.getAbsolutePath());
        System.out.println(inputFile.getAbsolutePath());
//        command.add(ffmpegExe.getAbsolutePath());
        command.add(FFMPEG_EXECUTOR);
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

//        String cmd = "'".concat(StringUtils.join(command.iterator(),' ')).concat("'");
//        String cmd = StringUtils.join(command.iterator(),' ');
        String cmd = "";
        return runProccess(cmd);
    }

    public static void main(String[] args) {
        extractThumbnail(new File("/data/slsxpt/web/upload/video/3d6d735531cdf2498f6ed722d80f4686.mp4"),"/data/slsxpt/web/upload/thumbnail/3d6d735531cdf2498f6ed722d80f4686.jpg");
        extractThumbnail(new File("/data/slsxpt/web/upload/video/ff8085cecb506336279f3693244d98a8.mp4"),"/data/slsxpt/web/upload/thumbnail/ff8085cecb506336279f3693244d98a8.jpg");
    }
}
