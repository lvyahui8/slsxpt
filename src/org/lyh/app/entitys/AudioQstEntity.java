package org.lyh.app.entitys;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2015/10/10.
 */
@Entity
@Table(name = "audio_qst", schema = "", catalog = "slsxpt")
public class AudioQstEntity extends BaseEntity{
    private String title;
    private String answer;
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


    @Basic
    @Column(name = "updated_at")
    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    private AudioEntity audio;

    @ManyToOne(targetEntity = AudioEntity.class,fetch = FetchType.LAZY)
    @JoinColumn(name = "audio_id")
    public AudioEntity getAudio() {
        return audio;
    }

    public void setAudio(AudioEntity audio) {
        this.audio = audio;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        AudioQstEntity that = (AudioQstEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (answer != null ? !answer.equals(that.answer) : that.answer != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (answer != null ? answer.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (updatedAt != null ? updatedAt.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "AudioQstEntity{" +
                "answer='" + answer + '\'' +
                ", title='" + title + '\'' +
                "} ";
    }
}
