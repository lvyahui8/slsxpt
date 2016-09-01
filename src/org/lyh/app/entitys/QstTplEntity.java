package org.lyh.app.entitys;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Timestamp;

/**
 * Created by Administrator on 2015/10/6.
 */
@Entity
@Table(name = "qst_tpl")
public class QstTplEntity extends BaseEntity{
    private String name;

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
    @Column(name = "created_at")
    public Timestamp getCreatedAt() {
        return createdAt;
    }


    @Basic
    @Column(name = "updated_at")
    public Timestamp getUpdatedAt() {
        return updatedAt;
    }

    private List<QstTplItemEntity> items = new ArrayList<>();

    @OneToMany(targetEntity = QstTplItemEntity.class, fetch = FetchType.LAZY,
            cascade = CascadeType.ALL,
            mappedBy = "template"
    )
    @OrderBy(value = "id asc")
    public List<QstTplItemEntity> getItems() {
        return items;
    }

    public void setItems(List<QstTplItemEntity> items) {
        this.items = items;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        QstTplEntity that = (QstTplEntity) o;

        if (id != null ? !id.equals(that.id) : that.id != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (updatedAt != null ? updatedAt.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "QstTplEntity{" +
                "name='" + name + '\'' +
                ", items=" + items +
                "} ";
    }
}
