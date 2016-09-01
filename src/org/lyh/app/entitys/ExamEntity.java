package org.lyh.app.entitys;

import org.hibernate.annotations.Where;
import org.lyh.library.Answer;

import javax.persistence.*;
import javax.xml.crypto.KeySelector;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Administrator on 2015/9/27.
 */
@Entity
@Table(name = "exam", schema = "")
public class ExamEntity extends ProjectEntity{

    private String content;
    private String answer;
    private String testType;

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
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
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
    @Column(name = "test_type")
    public String getTestType() {
        return testType;
    }

    public void setTestType(String testType) {
        this.testType = testType;
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

    private List<ExamQstEntity> questions = new ArrayList<>();

    @OneToMany(targetEntity = ExamQstEntity.class,fetch = FetchType.LAZY
            ,cascade = CascadeType.ALL
            ,mappedBy = "exam"
    )
    @OrderBy(value = "id asc")
    public List<ExamQstEntity> getQuestions() {
        return questions;
    }

    public void setQuestions(List<ExamQstEntity> questions) {
        this.questions = questions;
    }

    private Answer answers = new Answer();

    @Transient
    public Answer getAnswers() {
        return answers;
    }

    public void setAnswers(Answer answers) {
        this.answers = answers;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ExamEntity that = (ExamEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (answer != null ? !answer.equals(that.answer) : that.answer != null) return false;
        if (testType != null ? !testType.equals(that.testType) : that.testType != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        return !(updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null);

    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (answer != null ? answer.hashCode() : 0);
        result = 31 * result + (testType != null ? testType.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (updatedAt != null ? updatedAt.hashCode() : 0);
        return result;
    }

    @Transient
    public String getCnTestType() {
        String cnTestType = null;
        if(testType != null){
            switch (testType) {
                case "single":
                    cnTestType = "单选题";
                    break;
                case "multiple":
                    cnTestType = "多选题";
                    break;
                case "qa":
                    cnTestType = "问答题";
                    break;
                case "other":
                    cnTestType = "其它";
                    break;
                default:
            }
        }
        return cnTestType;
    }

    @Override
    public String toString() {
        return "ExamEntity{" +
                "content='" + content + '\'' +
                ", answer='" + answer + '\'' +
                ", testType='" + testType + '\'' +
                ", questions=" + questions +
                ", answers=" + answers +
                '}'+super.toString();
    }
}
