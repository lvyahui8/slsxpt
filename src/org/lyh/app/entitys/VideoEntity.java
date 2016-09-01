package org.lyh.app.entitys;

import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/9/27.
 */
@Entity
@Table(name = "video")
public class VideoEntity extends ProjectEntity {
    private String content;
    private String resourceUrl;
    private String thumbnail;


    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    @ManyToOne(targetEntity = CategoryEntity.class,fetch = FetchType.EAGER)
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
    @Column(name = "resource_url")
    public String getResourceUrl() {
        return resourceUrl;
    }

    public void setResourceUrl(String resourceUrl) {
        this.resourceUrl = resourceUrl;
    }

    @Basic
    @Column(name = "thumbnail")
    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    @Basic
    @Column(name = "praise_count")
    public Integer getPraiseCount() {
        return praiseCount;
    }

    protected List<VideoQstEntity> questions = new ArrayList<>();


    @OneToMany(targetEntity = VideoQstEntity.class, fetch = FetchType.LAZY
            , cascade = {CascadeType.ALL}, mappedBy = "video")
    @OrderBy(value = "id asc")
    public List<VideoQstEntity> getQuestions() {
        return questions;
    }

    public void setQuestions(List<VideoQstEntity> questions) {
        this.questions = questions;
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

    @Transient
    public String getShortTitle(){
        return this.title.length() > 10 ? this.title.substring(0,10) + "..." : this.title;
    }
    @Override
    public String toString() {
        return "VideoEntity{" +
                "content='" + content + '\'' +
                ", resourceUrl='" + resourceUrl + '\'' +
                ", thumbnail='" + thumbnail + '\'' +
                ", questions=" + questions +
                "} ";
    }
}
