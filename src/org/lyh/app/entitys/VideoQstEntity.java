package org.lyh.app.entitys;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 *
 * 因为这张表被四大块公用，而hibernate对一个数据库字段做多个属性注解的时候，只能有一个可以insert和update
 * 所以这里的就不一定用hibernate来做级联创建，级联更新，级联删除了，需要手动则手动级联
 *
 * Created by Administrator on 2015/9/27.
 */
@Entity
@Table(name = "video_qst", schema = "")
public class VideoQstEntity extends BaseEntity{
    private String title;
    private String answer;
//    private Integer projectId;

//    @Column(name = "video_id")
//    public Integer getProjectId() {
//        return projectId;
//    }
//
//    public void setProjectId(Integer projectId) {
//        this.projectId = projectId;
//    }



    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    @Basic
    @Column(name = "title")
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "answer")
    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }


    @Basic
    @Column(name = "created_at")
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Basic
    @Column(name = "updated_at")
    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Timestamp updatedAt) {
        this.updatedAt = updatedAt;
    }


    private VideoEntity video;

    @ManyToOne(targetEntity = VideoEntity.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "video_id")
    public VideoEntity getVideo() {
        return video;
    }

    public void setVideo(VideoEntity video) {
        this.video = video;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        VideoQstEntity that = (VideoQstEntity) o;

        if (id != that.id) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (answer != null ? !answer.equals(that.answer) : that.answer != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id == null ? 0 : id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (answer != null ? answer.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (updatedAt != null ? updatedAt.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "VideoQstEntity{" +
                "title='" + title + '\'' +
                ", answer='" + answer + '\'' +
                "} ";
    }

}
