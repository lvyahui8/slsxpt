package org.lyh.app.daos;

import org.lyh.app.entitys.CategoryEntity;

import java.util.List;


/**
 * Created by lvyahui on 2015-06-22.
 */
public class CategoryDao extends BaseDao<CategoryEntity>{

    public List<CategoryEntity> getTopCategorys() {
//        Criteria criteria =  this.getSession().createCriteria(CategoryEntity.class);
//        // 强制即刻加载
//        criteria.setFetchMode("childrens", FetchMode.SELECT);
//        // 防止得到重复记录
//        criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);

//        return (List<CategoryEntity>) criteria.add(Restrictions.eq("level",0)).list();

        //select distinct c1 from CategoryEntity c1 inner join c1.childrens c2 where (c2.parent is null or c1.id = c2.parent.id) and c1.id != 1 and c1.editor='yes' and c1.level=1
        return this.find("select distinct c1 from CategoryEntity c1 " +
                "where  c1.id != 1 and c1.editor='yes' and c1.parent=null");
        //
    }

}
