package org.lyh.app.entitys;

import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by admin on 2015/7/1.
 */
@Entity
@Table(name = "project", schema = "", catalog = "phoenixnest")
@DynamicInsert(value = true)
public class ProjectEntity {
    private Integer id;
    private String title;
    private String content;
    private String description;
    private String type;
    private String resourceUrl;
    private Integer praiseCount;
    private Integer viewCount;
    private Integer collectCount;
    private String enableTest;
    private String testType;
    private String answer;
    private Timestamp createdAt;
    private String enableComment;
    private Integer orderBy;
    private Integer testCount;
    private String thumbnail;

    private CategoryEntity category;

    /**
     * 表单附加数据,并不将该属性直接映射到数据库表中的列
     */
    private Integer category_id;

    @Transient
    public Integer getCategory_id() {
        return category_id;
    }

    public void setCategory_id(Integer category_id) {
        this.category_id = category_id;
    }

    @ManyToOne(targetEntity = CategoryEntity.class)
    @JoinColumn(name = "category_id")
    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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
    @Column(name = "content")
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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
    @Column(name = "praise_count")
    public Integer getPraiseCount() {
        return praiseCount;
    }

    public void setPraiseCount(Integer praiseCount) {
        this.praiseCount = praiseCount;
    }

    @Basic
    @Column(name = "view_count")
    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    @Basic
    @Column(name = "collect_count")
    public Integer getCollectCount() {
        return collectCount;
    }

    public void setCollectCount(Integer collectCount) {
        this.collectCount = collectCount;
    }

    @Basic
    @Column(name = "enableTest")
    public String getEnableTest() {
        return enableTest;
    }

    public void setEnableTest(String enableTest) {
        this.enableTest = enableTest;
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
    @Column(name = "enableComment")
    public String getEnableComment() {
        return enableComment;
    }

    public void setEnableComment(String enableComment) {
        this.enableComment = enableComment;
    }

    @Basic
    @Column(name = "order_by")
    public Integer getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(Integer orderBy) {
        this.orderBy = orderBy;
    }

    @Basic
    @Column(name = "test_count")
    public Integer getTestCount() {
        return testCount;
    }

    public void setTestCount(Integer testCount) {
        this.testCount = testCount;
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
    @Column(name = "description")
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Transient
    public String getCnType(){
        String cnType = "正常";
        switch (type){
            case "audio":
                cnType = "音频";
                break;
            case "video":
                cnType = "视频";
                break;
            case "exam":
                cnType = "试题";
                break;
            case "article":
                cnType = "文章";
                break;
            default:
                break;
        }
        return cnType;
    }

    @Transient
    public String getCnTestType(){
        String  cnTestType = null;
        switch (testType){
            case "single":
                cnTestType = "单选题";break;
            case "multiple" :
                cnTestType = "多选题";break;
            case "qa" :
                cnTestType = "问答题";break;
            case "other" :
                cnTestType = "其它";break;
            default:
        }
        return cnTestType;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProjectEntity that = (ProjectEntity) o;

        if (collectCount != that.collectCount) return false;
        if (id != that.id) return false;
        if (praiseCount != that.praiseCount) return false;
        if (viewCount != that.viewCount) return false;
        if (answer != null ? !answer.equals(that.answer) : that.answer != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (enableComment != null ? !enableComment.equals(that.enableComment) : that.enableComment != null)
            return false;
        if (enableTest != null ? !enableTest.equals(that.enableTest) : that.enableTest != null) return false;
        if (orderBy != null ? !orderBy.equals(that.orderBy) : that.orderBy != null) return false;
        if (resourceUrl != null ? !resourceUrl.equals(that.resourceUrl) : that.resourceUrl != null) return false;
        if (testType != null ? !testType.equals(that.testType) : that.testType != null) return false;
        if (title != null ? !title.equals(that.title) : that.title != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        Integer result = id;
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        result = 31 * result + (resourceUrl != null ? resourceUrl.hashCode() : 0);
        result = 31 * result + praiseCount;
        result = 31 * result + viewCount;
        result = 31 * result + collectCount;
        result = 31 * result + (enableTest != null ? enableTest.hashCode() : 0);
        result = 31 * result + (testType != null ? testType.hashCode() : 0);
        result = 31 * result + (answer != null ? answer.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (enableComment != null ? enableComment.hashCode() : 0);
        result = 31 * result + (orderBy != null ? orderBy.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "ProjectEntity{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", type='" + type + '\'' +
                ", resourceUrl='" + resourceUrl + '\'' +
                ", praiseCount=" + praiseCount +
                ", viewCount=" + viewCount +
                ", collectCount=" + collectCount +
                ", enableTest='" + enableTest + '\'' +
                ", testType='" + testType + '\'' +
                ", answer='" + answer + '\'' +
                ", createdAt=" + createdAt +
                ", enableComment='" + enableComment + '\'' +
                ", orderBy=" + orderBy +
                ", testCount=" + testCount +
                ", thumbnail='" + thumbnail + '\'' +
                ", category_id=" + category_id +
                '}';
    }
}
