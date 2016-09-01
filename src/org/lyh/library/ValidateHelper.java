package org.lyh.library;

import org.lyh.app.entitys.BaseEntity;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-27.
 */
public class ValidateHelper {
    private Map<String,String> errors = new HashMap<String,String>();
    private BaseEntity baseEntity;
    private Field properties [] = null;
    private Class clazz = null;

    public ValidateHelper(BaseEntity baseEntity) {
        this.baseEntity = baseEntity;
        this.clazz = baseEntity.getClass();
        this.properties = this.clazz.getDeclaredFields();
    }

    public boolean required(String prop){
        Field field = this.findField(prop);
        if(field!=null){
            field.setAccessible(true);
            try {
                Object value = field.get(baseEntity);
                if(value!=null){

                }
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    private Field findField(String prop){
        Field field = null;
        try {
            field = this.clazz.getDeclaredField(prop);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        }
        return field;
    }
}
