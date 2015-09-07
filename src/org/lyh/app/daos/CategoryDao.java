package org.lyh.app.daos;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.SimpleExpression;
import org.lyh.app.base.BaseDao;
import org.lyh.app.entitys.CategoryEntity;

import java.util.List;


/**
 * Created by lvyahui on 2015-06-22.
 */
public class CategoryDao extends BaseDao<CategoryEntity>{

    public List<CategoryEntity> getTopCategorys() {
        Criteria criteria =  this.getSession().createCriteria(CategoryEntity.class);
//        return criteria
//            .add(Restrictions.gt("id",1))
//            .add(Restrictions.eq("editor","yes"))
//            .add(Restrictions.eq("level",1))
//            .list();
        //select distinct c1 from CategoryEntity c1 inner join c1.childrens c2 where (c2.parent is null or c1.id = c2.parent.id) and c1.id != 1 and c1.editor='yes' and c1.level=1
        return this.find("select distinct c1 from CategoryEntity c1 " +
            "where  c1.id != 1 and c1.editor='yes' and c1.parent=null");

    }

}
