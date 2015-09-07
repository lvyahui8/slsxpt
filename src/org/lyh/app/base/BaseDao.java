package org.lyh.app.base;

import com.mchange.v1.util.ArrayUtils;
import com.mchange.v1.util.SetUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.lyh.app.base.paging.PageData;
import org.lyh.app.entitys.ProjectEntity;
import sun.management.snmp.jvminstr.JvmThreadInstanceEntryImpl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;


/**
 * Created by lvyahui on 2015-06-17.
 */
public class BaseDao<T>  {

    private Class <T> entityClass = (Class <T>) ((ParameterizedType) getClass()
        .getGenericSuperclass()).getActualTypeArguments()[0];;


    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public BaseDao() {
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public Session getSession(){
        return this.getSessionFactory().getCurrentSession();
    }

    public T get(Integer id){
        List<T> l = this.getSession().createCriteria(entityClass).add(Restrictions.idEq(id)).list();
        return l != null && l.size() > 0 ? l.get(0) : null;
    }

    public List<T> get(Map<String,Object> condition){
        Criteria criteria =  this.getSession().createCriteria(entityClass);
        fillCriteriaByCondition(criteria,condition);
        List<T> l = criteria.list();
        return l!=null && l.size()>0 ? l : null;
    }

    public T getFirst(Map <String,Object> condition){
        Criteria criteria =  this.getSession().createCriteria(entityClass);
        criteria.setMaxResults(1);
        fillCriteriaByCondition(criteria, condition);
        List<T> l = criteria.list();
        return l!=null && l.size()>0 ? l.get(0) : null;
    }

    public void fillCriteriaByCondition(Criteria criteria,Map <String,Object> condition){
        Object keys[] = condition.keySet().toArray();
        for (int i = 0; i < keys.length; i++) {
            criteria.add(Restrictions.eq((String)keys[i],condition.get((String)keys[i])));
        }
    }


    public Serializable save(T entity){
        return this.getSession().save(entity);
    }

    public void update(T entity){
        this.getSession().saveOrUpdate(entity);
    }

    public void delete(T entity){
        this.getSession().delete(entity);
    }

    public void delete(Serializable id){
        this.getSession()
            .createQuery("delete " + entityClass.getSimpleName()+ " en where en.id = ?")
            .setParameter(1, id).executeUpdate();
    }

    public List<T> findAll(){
        return this.find("select en from "+ entityClass.getSimpleName()+" en");
    }

    public List<T> findByProps(){
        return null;
    }

    public long count(){
        List<?> l = find("select count(*) from " + entityClass.getSimpleName());
        if(l != null && l.size() == 1 ){
            return (Long)l.get(0);
        }
        return 0;
    }

    public List<T> find(String hql) {
        return (List<T>)this.getSession().createQuery(hql).list();
    }



    public List<T> find(String hql,Object ... params){
        Query query = this.getSession().createQuery(hql);
        for (int i = 0,len = params.length; i < len ; i++) {
            query.setParameter(i+"",params[i]);
        }
        return (List<T>)query.list();
    }

    public List<T> findByPage(String hql,int pageNo,int pageSize){
        return (List<T>)this.getSession().createQuery(hql).setFirstResult((pageNo-1)*pageSize)
            .setMaxResults(pageSize).list();
    }

    public List<T> findByPage(String hql,int pageNo,int pageSize,Object ... params){
        Query query = this.getSession().createQuery(hql);
        for (int i = 0,len = params.length; i < len; i++) {
            query.setParameter(i+"",params[i]);
        }
        return (List<T>) query.setFirstResult((pageNo - 1) * pageSize).setMaxResults(pageSize).list();
    }

    public List<T> findByPage(Integer currentPage,Integer pageSize){
        Criteria criteria =  this.getSession().createCriteria(entityClass);
        criteria.setFirstResult((currentPage - 1) * pageSize);// 0 表示第一条记录
        criteria.setMaxResults(pageSize);
        return criteria.list();
    }

    public List<T> findByPage(Map<String,Object> attributes,Integer currentPage,Integer pageSize){
        Criteria criteria =  this.getSession().createCriteria(entityClass);
        criteria.setFirstResult((currentPage - 1) * pageSize);// 0 表示第一条记录
        criteria.setMaxResults(pageSize);
        this.fillCriteriaByCondition(criteria, attributes);
        return criteria.list();
    }

    public PageData<T> findByPage(Map<String, Object> attributes, PageData<T> pageData, String orderProp) {
        Criteria criteria = this.getSession().createCriteria(entityClass);
        if(attributes != null){
            this.fillCriteriaByCondition(criteria, attributes);
        }
        pageData.setTotalItem(criteria.list().size());
        criteria.setFirstResult((pageData.getCurrentPage() - 1) * pageData.getPageSize());
        criteria.setMaxResults(pageData.getPageSize());
        criteria.addOrder(Order.desc(orderProp));
        pageData.setDatas(criteria.list());
        return pageData;
    }

    public PageData<T> findByPage(List<Criterion> condition,PageData<T> pageData,String orderProp){
        Criteria criteria = this.getSession().createCriteria(entityClass);
        if(condition != null){
            for(Criterion ct : condition){
                criteria.add(ct);
            }
        }
        pageData.setTotalItem(criteria.list().size());
        criteria.setFirstResult((pageData.getCurrentPage() - 1) * pageData.getPageSize());
        criteria.setMaxResults(pageData.getPageSize());
        if(orderProp != null){
            criteria.addOrder(Order.desc(orderProp));
        }
        pageData.setDatas(criteria.list());
        return pageData;
    }
}
