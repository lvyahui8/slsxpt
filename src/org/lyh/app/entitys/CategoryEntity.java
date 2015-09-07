package org.lyh.app.entitys;

import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.Generated;
import org.hibernate.annotations.GenerationTime;
import org.lyh.app.base.BaseEntity;

import javax.persistence.*;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * Created by lvyahui on 2015-06-18.
 */
@Entity
@Table(name = "category", schema = "", catalog = "phoenixnest")
@DynamicInsert(value = true) // 动态插入sql 实体的空字段使用数据库表的默认值
public class CategoryEntity extends BaseEntity{
    @Transient
    public static final int ROOT_LEVEL = 0;

    private int id;
    private String name;
    private int level;
    private String editor;
    private String type;


    private CategoryEntity parent;
    private Set<CategoryEntity> childrens = new LinkedHashSet<CategoryEntity>();

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    @ManyToOne(targetEntity = CategoryEntity.class)
    @JoinColumn(name = "category_id",unique = true)
    public CategoryEntity getParent() {
        return parent;
    }

    public void setParent(CategoryEntity parent) {
        this.parent = parent;
    }

    @OneToMany(targetEntity = CategoryEntity.class,fetch = FetchType.EAGER)
    @JoinColumn(name = "category_id",unique = true)
    public Set<CategoryEntity> getChildrens() {
        return childrens;
    }

    public void setChildrens(Set<CategoryEntity> childrens) {
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        CategoryEntity that = (CategoryEntity) o;

        if (id != that.id) return false;
        if (name != that.name) return false;
        if (type != that.type) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + level;
        result = 31 * result + (editor != null ? editor.hashCode() : 0);
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
            '}' + "\n";
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

}
