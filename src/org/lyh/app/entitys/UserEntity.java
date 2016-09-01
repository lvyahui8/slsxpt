package org.lyh.app.entitys;

import org.hibernate.annotations.DynamicInsert;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by lvyahui on 2015-06-26.
 */
@Entity
@Table(name = "user", schema = "")
@DynamicInsert(value = true)
public class UserEntity extends BaseEntity {
    private String username;
    private String password;
    private String salt;
    private String name;

    @Basic
    @Column(name = "label")//新建字段后要记得添加set,get方法并对get方法添加上注解
    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    @Basic
    @Column(name = "clazz")
    public String getClazz() {
        return clazz;
    }

    public void setClazz(String clazz) {
        this.clazz = clazz;
    }

    private String clazz;
    private String label;
    private Integer gold;
    private Integer progress;

    private String email;
    private String phone;
    private String code;
    private String type;
    private String avatar;

    /* 表单附加数据 */
    private String rePassword;
    private String remenberMe;
    private Integer categoryId;
    @Transient
    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Integer getId() {
        return id;
    }

    @Basic
    @Column(name = "username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password")
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Basic
    @Column(name = "salt")
    public String getSalt() {
        return salt;
    }

    public void setSalt(String salt) {
        this.salt = salt;
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
    @Column(name = "gold")
    public Integer getGold() {
        return gold;
    }

    public void setGold(Integer gold) {
        this.gold = gold;
    }

    @Basic
    @Column(name = "progress")
    public Integer getProgress() {
        return progress;
    }

    public void setProgress(Integer progress) {
        this.progress = progress;
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


    @Basic
    @Column(name = "email")
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "phone")
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Basic
    @Column(name = "code")
    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
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
    @Column(name = "avatar")
    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    /* 表单附加数据setter，getter*/
    @Transient
    public String getRePassword() {
        return rePassword;
    }

    public void setRePassword(String rePassword) {
        this.rePassword = rePassword;
    }

    @Transient
    public String getRemenberMe() {
        return remenberMe;
    }

    public void setRemenberMe(String remenberMe) {
        this.remenberMe = remenberMe;
    }

    private CollegeEntity college;//实体的相关联的college表的实体，并提供get和set

    @ManyToOne(targetEntity = CollegeEntity.class)//一个学院对应多个学生
    @JoinColumn(name = "college_id")//关联的外键字段
    public CollegeEntity getCollege() {
        return college;
    }

    public void setCollege(CollegeEntity college) {
        this.college = college;
    }

    private Integer collegeId;

    @Transient
    public Integer getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Integer collegeId) {
        this.collegeId = collegeId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UserEntity that = (UserEntity) o;

        if (id != that.id) return false;
        if (username != null ? !username.equals(that.username) : that.username != null)
            return false;
        if (password != null ? !password.equals(that.password) : that.password != null)
            return false;
        if (salt != null ? !salt.equals(that.salt) : that.salt != null) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (gold != null ? !gold.equals(that.gold) : that.gold != null) return false;
        if (progress != null ? !progress.equals(that.progress) : that.progress != null)
            return false;
        if (createdAt != null ? !createdAt.equals(that.createdAt) : that.createdAt != null)
            return false;
        if (updatedAt != null ? !updatedAt.equals(that.updatedAt) : that.updatedAt != null)
            return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (phone != null ? !phone.equals(that.phone) : that.phone != null) return false;
        if (code != null ? !code.equals(that.code) : that.code != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (username != null ? username.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (salt != null ? salt.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (gold != null ? gold.hashCode() : 0);
        result = 31 * result + (progress != null ? progress.hashCode() : 0);
        result = 31 * result + (createdAt != null ? createdAt.hashCode() : 0);
        result = 31 * result + (updatedAt != null ? updatedAt.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);
        result = 31 * result + (code != null ? code.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        return "UserEntity{\n" +
            "    id=" + id + ",\n" +
            "    username='" + username + "\',\n" +
            "    password='" + password + "\',\n" +
            "    salt='" + salt + "\',\n" +
            "    name='" + name + "\',\n" +
            "    gold=" + gold + ",\n" +
            "    progress=" + progress + ",\n" +
            "    createdAt=" + createdAt + ",\n" +
            "    updatedAt=" + updatedAt + ",\n" +
            "    email='" + email + "\',\n" +
            "    phone='" + phone + "\',\n" +
            "    code='" + code + "\',\n" +
            "    avatar='" + avatar + "\',\n" +
            "    rePassword='" + rePassword + "\',\n" +
            "    remenberMe='" + remenberMe + "\',\n" +
            '}' + "\n";
    }




    public boolean validate() {
        if(username == null || "".equals(username.trim())){
            addError("username","required","用户名不能为空");
        }
        if(password == null || "".equals(password.trim())){
            addError("password","required","密码不能为空");
        }
        if(email == null || "".equals(email.trim())){
            addError("email","required","邮箱不能为空");
        }
        if(rePassword == null || "".equals(rePassword.trim())){
            addError("rePassword","required","确认密码不能为空");
        }
        return errors.size() == 0;
    }

    @Override
    public void initLabels() {
        labels.put("username","用户名");
        labels.put("password","用户名");
        labels.put("email","邮箱");
        labels.put("rePassword","确认密码");
    }

    @Transient
    public String getCnType(){
        String cnType = "会员";
//        System.out.println(type);
        if(type != null){
            switch (type){
                case "root":
                    cnType = "超级管理员";break;
                case "admin":
                    cnType = "管理员";break;
                default: break;
            }
        }
        return cnType;
    }
}
