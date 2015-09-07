package org.lyh.app.base;

import org.lyh.library.ValidateHelper;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-27.
 */
public class BaseEntity {
    protected Map<String,Map<String,String>> errors
        = new HashMap<String,Map<String,String>>();
    protected Map<String,String> labels = new HashMap<String,String>();

    public BaseEntity() {
        this.initLabels();
    }

    public Map<String,Map<String,String>> getErrors() {
        return errors;
    }


    public void addError(String prop,String validetorType,String message){
        Map<String,String> error = this.errors.get(prop);
        if(error==null || error.size() == 0){
            error = new HashMap<String,String>();
            errors.put(prop,error);
        }
        error.put(validetorType,message);
    }

    public Map<String,String> getError(String prop){
        return this.errors.get(prop);
    }

    public String [][] rules(){
        return null;
    }

    public Map<String,String> getLabels(){
        return this.labels;
    }
    public void initLabels(){

    }


    public void fill(Map<String, String[]> parameterMap) {
        //System.out.println(this.getClass());
        Class clazz = this.getClass();
        Field fields[] = clazz.getDeclaredFields();
        for (int i = 0; i < fields.length; i++) {
            String fieldName = fields[i].getName();
            //System.out.println(fieldName);
            try {
                // 查找参数集合
                String values [] = parameterMap.get(fieldName);
                if(values!=null && values.length>0){
                    String methodName = "set"+fieldName.substring(0, 1).toUpperCase()
                        + fieldName.substring(1);
                    Class fieldType = fields[i].getType();
                    Method method = clazz.getMethod(methodName,new Class[]{fieldType});
                    // 设值
                    method.invoke(this,new Object[]{fieldType.cast(values[0])});
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

}
