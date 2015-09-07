package org.lyh.test.encode;

import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;

/**
 * Created by lvyahui on 2015-06-28.
 */
public class EncodeTest {
    public static void main(String[] args) {
        String str = "我是吕亚辉";
        String newStr = null;

      newStr = new String(str.getBytes(), Charset.forName("UTF-8"));

        System.out.println(newStr);
        System.out.println(str.equals(newStr));// 符合编码UTF8
        newStr = new String(str.getBytes(), Charset.forName("GBK"));

        System.out.println(newStr);
        System.out.println(str.equals(newStr));// 不符合GBK
    }
}
