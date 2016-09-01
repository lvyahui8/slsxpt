package org.lyh.app.entitys;

import org.springframework.core.annotation.Order;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2015/9/27.
 */
@Entity
@Table(name = "audio", schema = "")
public class AudioEntity extends ProjectEntity{
    private String resourceUrl;
    private String content;

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
    @Column(name = "resource_url")
    public String getResourceUrl() {
        return resourceUrl;
    }

    public void setResourceUrl(String resourceUrl) {
        this.resourceUrl = resourceUrl;
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    private List<AudioQstEntity> questions = new ArrayList<>();

    @OneToMany(targetEntity = AudioQstEntity.class, fetch = FetchType.LAZY
            , cascade = CascadeType.ALL
            , mappedBy = "audio"
    )
    @OrderBy(value = "id asc")
    public List<AudioQstEntity> getQuestions() {
        return questions;
    }

    public void setQuestions(List<AudioQstEntity> questions) {
        this.questions = questions;
    }

    @Override
    public String toString() {
        return "AudioEntity{" +
                "id='" + id + '\'' +
                "categoryId='" + categoryId + '\'' +
                "title='" + title + '\'' +
                "content='" + content + '\'' +
                "resourceUrl='" + resourceUrl + '\'' +
                ", content='" + content + '\'' +
                ", questions=" + questions +
                '}';
    }
}
