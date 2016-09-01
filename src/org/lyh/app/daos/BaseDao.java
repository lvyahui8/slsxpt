package org.lyh.app.daos;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.lyh.app.entitys.BaseEntity;
import org.lyh.library.paging.PageData;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;
import java.util.Map;


/**
 * Created by lvyahui on 2015-06-17.
 */
public class BaseDao<T extends BaseEntity>  {

    private Class <T> entityClass = (Class <T>) ((ParameterizedType) getClass()
        .getGenericSuperclass()).getActualTypeArguments()[0];

    private SessionFactory sessionFactory;
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Criteria criterias;
    public BaseDao() {

    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public Session getSession(){
        return this.getSessionFactory().getCurrentSession();
    }

    public T get(Integer id){
//        List<T> l = this.getSession().createCriteria(entityClass).add(Restrictions.idEq(id)).list();
//        return l != null && l.size() > 0 ? l.get(0) : null;
        return (T) this.getSession().load(entityClass,id);
//        return (T) this.getSession().get(entityClass,id);
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


    public Integer save(T entity){
        /*
         * 本应用数据库的主键值都是整形数值
         */
        return (Integer)this.getSession().save(entity);
    }

    public void update(T entity){
        this.getSession().saveOrUpdate(entity);
    }

    public void delete(T entity){
        this.getSession().delete(entity);
    }

    public boolean delete(Serializable id){
        int row = this.getSession()
            .createQuery("delete " + entityClass.getSimpleName()+ " en where en.id = ?")
            .setParameter(1, id).executeUpdate();
        return row == 1;
    }


    public List<T> findAll(){
        return this.find("select en from " + entityClass.getSimpleName() + " en");
    }

    public List<T> all(){
        return this.getSession().createCriteria(entityClass).list();
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



    public List<T> find(String hql, Object... params){
        Query query = this.getSession().createQuery(hql);
        for (int i = 0,len = params.length; i < len ; i++) {
            query.setParameter(i+"",params[i]);
        }
        return (List<T>)query.list();
    }

    public List<T> findByPage(String hql,int pageNo,int pageSize){
        return (List<T>)this.getSession().createQuery(hql).setFirstResult((pageNo - 1) * pageSize)
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

    public  PageData<T>  findByPage(Map<String, Object> condition, PageData<T> pageData, String orderProp) {
        Criteria criteria = this.getSession().createCriteria(entityClass);
        if(condition != null && !condition.isEmpty()){
            this.fillCriteriaByCondition(criteria, condition);
        }

        pageData.setTotalItem(criteria.list().size());

        criteria.setFirstResult((pageData.getCurrentPage() - 1) * pageData.getPageSize());
        criteria.setMaxResults(pageData.getPageSize());
        criteria.addOrder(Order.desc(orderProp));
        pageData.setDatas(criteria.list());
        return pageData;
    }

    public PageData<T>  findByPage(List<Criterion> condition,PageData<T> pageData,String orderProp){
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

    public BaseDao where(String prop,Object value){
        if(this.criterias == null){
            this.criterias = this.getSession().createCriteria(entityClass);
        }
        this.criterias.add(Restrictions.eq(prop, value));
        return this;
    }

    public List<T> get(){
        List<T> beans = criterias.list();
        criterias = this.getSession().createCriteria(entityClass);
        return beans;
    }

    public boolean delete(String attribute,Object value){
        String hql = "delete from " + entityClass.getSimpleName() + " where " + attribute + "=?";
        return this.getSession().createQuery(hql).setParameter(0,value).executeUpdate() > 0;
    }


    public T prev(T entity,String orderAttr,boolean desc){
        String hql = "select en from " + entityClass.getSimpleName() + " en where en." + orderAttr + "> ? order by en.createdAt";
        Query query = this.getSession().createQuery(hql).setParameter(0,entity.getCreatedAt());
        query.setMaxResults(1);
        List<T> res = query.list();
        return res.size() > 0 ? res.get(0) : null;
    }

    //获取前一个id
    public T prev(T entity){//获取上一个id
        return this.prev(entity,"createdAt",true);
    }

    public T next(T entity){//获取前下一个id

        return this.next(entity,"createdAt",true);
    }
    public T next(T entity,String orderAttr,boolean desc){
        String hql = "select en from " + entityClass.getSimpleName() + " en where en." + orderAttr + "< ? order by en.createdAt desc";
        Query query = this.getSession().createQuery(hql).setParameter(0,entity.getCreatedAt());//按照建立的时间查找
        query.setMaxResults(1);
        List<T> res = query.list();
        return res.size() > 0 ? res.get(0) : null;
    }

    //获取

    public List<T> listOrderBy(String orderAttr,Integer size,Integer offset,boolean desc){
        String hql = "select en from " + entityClass.getSimpleName() + " en  order by en." + orderAttr + (desc ? " desc" : null);
        Query query = this.getSession().createQuery(hql);//按照建立的时间查找
        if(offset != null){
            query.setFirstResult(offset);
        }
        if(size != null){
            query.setMaxResults(size);
        }
        return query.list();
    }

    //获取
    public List<T> listOrderByCreatedAt(Integer size,Integer offset,boolean desc){
        return this.listOrderBy("createdAt",size,offset,desc);
    }

}
