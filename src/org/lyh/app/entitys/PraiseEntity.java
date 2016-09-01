package org.lyh.app.entitys;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by lvyahui on 15-7-7.
 */
@Entity
@Table(name = "praise", schema = "")
public class PraiseEntity extends BaseEntity {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
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

}
