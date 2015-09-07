package org.lyh.test.map;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-28.
 */
public class MapTest {
    public static void main(String[] args) {
        Map<String,Map<String,String>> errors
            = new HashMap<String,Map<String,String>>();
        errors.put("admin",new HashMap<String, String>());
        errors.get("admin").put("lvyahui", "admin888");
        System.out.println(errors.get("admin"));
    }
}
