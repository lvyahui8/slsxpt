package org.lyh.library;

import org.jsoup.Jsoup;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Map;
import java.util.UUID;

/**
 * Created by lvyahui on 2015-06-09.
 */
public class
        SiteHelpers {

    /**
     * 生成字符串的32位md5加密值
     * @param str 要加密的字符串
     * @return
     */
    public static String md5(String str){
        StringBuilder sb = new StringBuilder();
        try {
            MessageDigest md5 = MessageDigest.getInstance("MD5");
            byte[] bytes = md5.digest(str.getBytes());
            for (byte b : bytes){
                String toHexChar = Integer.toHexString(b & 0xff);
                sb.append(toHexChar.length() == 1 ? '0'+toHexChar : toHexChar );
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

    /**
     * 生成32位随机UUID
     * @return 32个字节的字符串
     */
    public static String uuid(){
        return UUID.randomUUID().toString().replace("-", "");
    }

    public static String hashPassword(String password,String salt){
        /*
            密码加盐方式
            盐+密码+盐
         */
        return md5(salt + password + salt);
    }

    public static void p(Object obj){
        System.out.println(obj);
    }

    public static void pe(Object obj){
        p(obj);
        System.exit(0);
    }

    public static String html2text(String html){
        return Jsoup.parse(html).text();
    }

    public static void main(String[] args) {
        System.out.println(html2text("<html><body><div>nihao&nbsp;</div></body></html>"));
    }
}
