package org.lyh.app.entitys;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by lvyahui on 15-7-7.
 */
@Entity
@Table(name = "tag_select", schema = "", catalog = "phoenixnest")
public class TagSelectEntity {
    private int id;
    private Timestamp createdAt;

    @Id
    @Column(name = "id")
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "created_at")
    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TagSelectEntity that = (TagSelectEntity) o;

        if (id != that.id) return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        return result;
    }
}
