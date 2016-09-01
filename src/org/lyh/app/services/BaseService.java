package org.lyh.app.services;

import com.opensymphony.xwork2.ActionContext;
import org.apache.struts2.ServletActionContext;
import org.lyh.app.entitys.UserEntity;
import org.lyh.library.paging.PageData;
import org.lyh.app.daos.BaseDao;
import org.lyh.app.entitys.BaseEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-17.
 */
@Service
@Transactional
public class BaseService<T extends BaseEntity> {
    protected BaseDao<T> baseDao;

    public void setBaseDao(BaseDao<T> baseDao) {
        this.baseDao = baseDao;
    }

    public void update(T entity) {
        this.baseDao.update(entity);
    }

    public Integer add(T entity) {
        return this.baseDao.save(entity);
    }

    public boolean delete(T entity) {
//        return this.baseDao.delete(entity.getId());
        this.baseDao.delete(entity);
        return true;
    }

    public T get(Integer id) {
        return this.baseDao.get(id);
    }

    public PageData<T> getDatas(PageData<T> pageData) {
        return this.getDatas(pageData, null);
    }

    public PageData<T> getDatas(PageData<T> pageData,Map<String,Object> condition){
        if(condition == null){
            condition = new HashMap <> ();
        }
        return this.baseDao.findByPage(condition, pageData, "createdAt");
    }

    public UserEntity getLoginUser(){
//        return (UserEntity) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
        return (UserEntity) ActionContext.getContext().getSession().get("loginUser");
    }

    public void handleEntity(T existEntity) {

    }
    //获取列表数据
    public List<T> getList(Integer size,Integer offset,String orderProp,boolean desc){
        return this.baseDao.listOrderBy(orderProp,size,offset,desc);
    }
}
