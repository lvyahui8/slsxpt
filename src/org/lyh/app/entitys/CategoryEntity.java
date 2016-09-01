package org.lyh.app.entitys;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

/**
 * Created by lvyahui on 2015-06-18.
 * 注意
 * 这个实体的大部分关系不能延迟加载，因为这个类型的实体构成的栏目树被放到了服务器session中，
 * hibernate的dbseesion最多维持一个请求，不能跨请求。
 * 除非这个属性不会跨请求使用（也就是在服务器中不会夸请求使用）
 *
 */
@Entity
@Table(name = "category", schema = "")
@DynamicInsert(value = true) // 动态插入sql 实体的空字段使用数据库表的默认值
public class CategoryEntity extends BaseEntity{
    @Transient
    public static final int ROOT_LEVEL = 0;

    private String  name;
    private Integer level;
    private String  editor;
    private String  type;

    /*
     *
     */
    private Integer parentId;

    private CategoryEntity parent;
    private List<CategoryEntity> childrens = new LinkedList<>();

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "level")
    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    @ManyToOne(targetEntity = CategoryEntity.class, fetch = FetchType.LAZY)
    @JoinColumn(name = "category_id", unique = true)
    public CategoryEntity getParent() {
        return parent;
    }

    public void setParent(CategoryEntity parent) {
        this.parent = parent;
    }

    @OneToMany(targetEntity = CategoryEntity.class,fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id",nullable = true)
    public List<CategoryEntity> getChildrens() {
        return childrens;
    }

    public void setChildrens(List<CategoryEntity> childrens) {
        this.childrens = childrens;
    }

    @Basic
    @Column(name = "editor",nullable = true)
    public String getEditor() {
        return editor;
    }

    public void setEditor(String editor) {
        this.editor = editor;
    }

    @Basic
    @Column(name = "type")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Transient
    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    private Integer qstTplId;

    /**
     * 一个字段多个属性，必须只有一个可以insert和update。
     * 这里主要是为了减少数据库查询次数，如果我只需要只掉这个外键id：qst_tpl_id，而暂时不需要知道外键记录
     * @return
     */
    @Column(name = "qst_tpl_id",insertable = false,updatable = false)
    public Integer getQstTplId() {
        return qstTplId;
    }

    public void setQstTplId(Integer qstTplId) {
        this.qstTplId = qstTplId;
    }

    private QstTplEntity template;

    @OneToOne(targetEntity = QstTplEntity.class, fetch = FetchType.LAZY,cascade = CascadeType.REFRESH)
    @JoinColumn(name = "qst_tpl_id")
    public QstTplEntity getTemplate() {
        return template;
    }

    public void setTemplate(QstTplEntity template) {
        this.template = template;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategoryEntity that = (CategoryEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (level != null ? !level.equals(that.level) : that.level != null) return false;
        if (editor != null ? !editor.equals(that.editor) : that.editor != null) return false;
        if (type != null ? !type.equals(that.type) : that.type != null) return false;
        if (qstTplId != null ? !qstTplId.equals(that.type) : that != null) return false;
        return true;
    }

    @Override
    public int hashCode() {
        int result = id != null ? id.hashCode() : 0;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (level != null ? level.hashCode() : 0);
        result = 31 * result + (editor != null ? editor.hashCode() : 0);
        result = 31 * result + (type != null ? type.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "CategoryEntity{\n" +
                "    id=" + id + ",\n" +
                "    name='" + name + "\',\n" +
                "    level=" + level + ",\n" +
                "    editor='" + editor + "\',\n" +
                "    type='" + type + "\',\n" +
                "    qstTplId='" + qstTplId + "\',\n" +
                '}' + "\n";
    }

    @Transient
    public String getCnType() {
        String cnType = "正常";
        switch (type) {
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
    public String getUrl() {
        return ServletActionContext.getRequest().getContextPath() + "/" +
                getType() + "-list.action?categoryId=" + this.id;
    }

}
