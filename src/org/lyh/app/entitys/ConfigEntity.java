package org.lyh.app.entitys;

import javax.persistence.*;

/**
 * Created by lvyahui on 15-7-7.
 */
@Entity
@Table(name = "config", schema = "")
public class ConfigEntity extends BaseEntity{
    private String name;
    private String value;

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
    @Column(name = "value")
    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

}
