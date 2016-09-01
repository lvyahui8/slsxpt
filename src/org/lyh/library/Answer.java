package org.lyh.library;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/10/12.
 */
public class Answer {

    private List<Long> right = new ArrayList<>();
    private List<String> items = new ArrayList<>();

    public List<Long> getRight() {
        return right;
    }

    public void setRight(List<Long> right) {
        this.right = right;
    }

    public List<String> getItems() {
        return items;
    }

    public void setItems(List<String> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Answer{" +
                "right=" + right +
                ", items=" + items +
                '}';
    }

    public boolean isRight(int i){
//        System.out.println(i+" eq "+right.contains(i));
//        System.out.println(right);
        for (Long x : right){
            if(x.intValue() == i){
                return true;
            }
        }
        return false;
    }
}
