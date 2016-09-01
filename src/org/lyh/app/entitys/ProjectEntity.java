package org.lyh.app.entitys;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by admin on 2015/7/1.
 */

public class ProjectEntity extends BaseEntity{

    protected String title;
    protected Integer praiseCount  = 0;
    protected Integer viewCount    = 0;
    protected Integer collectCount = 0;
    protected CategoryEntity category;
    protected UserEntity     user;

    /**
     * 表单附加数据,并不将该属性直接映射到数据库表中的列
     */
    protected Integer categoryId;

    @Transient
    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public void setUser(UserEntity user){
        this.user = user;
    }


    public void setPraiseCount(Integer praiseCount) {
        this.praiseCount = praiseCount;
    }


    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }


    public void setCollectCount(Integer collectCount) {
        this.collectCount = collectCount;
    }


    public void setTitle(String title) {
        this.title = title;
    }

    @Override
    public String toString() {
        return "ProjectEntity{" +
                "title='" + title + '\'' +
                ", praiseCount=" + praiseCount +
                ", viewCount=" + viewCount +
                ", collectCount=" + collectCount +
                ", user=" + user +
                ", categoryId=" + categoryId +
                "} " + super.toString();
    }

    private ProjectEntity prev ;
    private ProjectEntity next ;

    @Transient
    public ProjectEntity getPrev() {
        return prev;
    }

    public void setPrev(ProjectEntity prev) {
        this.prev = prev;
    }

    @Transient
    public ProjectEntity getNext() {
        return next;
    }

    public void setNext(ProjectEntity next) {
        this.next = next;
    }


}
