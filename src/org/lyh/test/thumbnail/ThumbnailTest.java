package org.lyh.test.thumbnail;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2015/7/15.
 */
public class ThumbnailTest {
    public static final String FFMPEG_EXECUTOR = "C:/Software/ffmpeg.exe";
    public static final int THUMBNAIL_WIDTH = 300;
    public static final int THUMBNAIL_HEIGHT = 200;
    public static void main(String[] args) {
        File inputFile = new File("F:/test.mp4");
        boolean ok = extractThumbnail(inputFile,"F:\\test.jpg");
        System.out.println(ok);
    }

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
            Process process = builder.start();
            InputStream inputStream = process.getInputStream();
            byte [] buffer = new byte[1024];
            while(inputStream.read(buffer)!=-1){
                System.out.println(new String(buffer));
            }
            inputStream.close();
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

}
