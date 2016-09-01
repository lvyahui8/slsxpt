package org.lyh.app.entitys;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2015/9/27.
 */
@Entity
@Table(name = "article", schema = "")
public class ArticleEntity extends ProjectEntity {

    private String content;
    private String description;

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    @ManyToOne(targetEntity = CategoryEntity.class)
    @JoinColumn(name = "category_id")
    public CategoryEntity getCategory() {
        return category;
    }

    @ManyToOne(targetEntity = UserEntity.class)
    @JoinColumn(name = "user_id")
    public UserEntity getUser(){
        return this.user;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    @Basic
    @Column(name = "praise_count")
    public Integer getPraiseCount() {
        return praiseCount;
    }

    @Basic
    @Column(name = "view_count")
    public Integer getViewCount() {
        return viewCount;
    }

    @Basic
    @Column(name = "collect_count")
    public Integer getCollectCount() {
        return collectCount;
    }

    @Basic
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }




    @Basic
    @Column(name = "created_at")
    public Timestamp getCreatedAt() {
        return createdAt;
    }


    @Basic
    @Column(name = "updated_at")
    public Timestamp getUpdatedAt() {
        return updatedAt;
    }


}
