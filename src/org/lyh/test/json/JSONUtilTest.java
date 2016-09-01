package org.lyh.test.json;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
public class JSONUtilTest {
    public static void main(String[] args) {
        String json = "{\"items\":[\"水电费水电费收到\",\"是的发送到收到收到的\",\"的说法都是的sd\",\" 是的发送到收到 \"],\"right\":[0,2]}";
        try {
            System.out.println(JSONUtil.deserialize(json));
        } catch (JSONException e) {
            e.printStackTrace();
        }
        List<Integer> its = new ArrayList<>();
        its.add(new Integer(1));
        its.add(2);
        System.out.println(its.contains(1));
    }
}
