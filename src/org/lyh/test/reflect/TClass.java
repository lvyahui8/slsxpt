package org.lyh.test.reflect;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;

/**
 * Created by lvyahui on 2015-06-28.
 */
public class TClass {

    public static Base<?> instance = null;
    public static void main(String [] args){
        instance = new C();
        instance.getTClassName(); // 异常，如何能输出java.lang.Float？
    }
}

abstract class ImportantBase<T extends Number>{}

abstract class Base<T extends Number> extends ImportantBase<T>
{
    public static <T> void getTClassName()
    {
        Type t = TClass.instance.getClass().getGenericSuperclass();
        System.out.println(t);
        Type[] params = ((ParameterizedType) t).getActualTypeArguments();
        Class<T> cls = (Class<T>) params[0];
        System.out.println(cls.getName());
    }
}
class C extends Base<Float>{

}