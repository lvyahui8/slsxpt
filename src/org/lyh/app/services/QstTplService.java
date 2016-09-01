package org.lyh.app.services;

import org.lyh.app.daos.QstTplItemDao;
import org.lyh.app.entitys.QstTplEntity;
import org.lyh.app.entitys.QstTplItemEntity;

/**
 * Created by Administrator on 2015/11/15.
 */
public class QstTplService extends BaseService<QstTplEntity> {

    private QstTplItemDao qstTplItemDao ;

    public void setQstTplItemDao(QstTplItemDao qstTplItemDao) {
        this.qstTplItemDao = qstTplItemDao;
    }

    @Override
    public Integer add(QstTplEntity qstTpl) {
        for(QstTplItemEntity qstTplItem : qstTpl.getItems()){
            qstTplItem.setTemplate(qstTpl);
        }
        return super.add(qstTpl);
    }


    @Override
    public void update(QstTplEntity entity) {
        this.qstTplItemDao.delete("qst_tpl_id",entity.getId());
        QstTplEntity existQstTpl = this.baseDao.get(entity.getId());
        for(QstTplItemEntity qstTplItem : entity.getItems()){
            existQstTpl.getItems().add(qstTplItem);
            qstTplItem.setTemplate(existQstTpl);
        }
        existQstTpl.setName(entity.getName());
        baseDao.save(existQstTpl);
    }

    @Override
    public boolean delete(QstTplEntity entity) {
        this.qstTplItemDao.delete("qst_tpl_id",entity.getId());
        return super.delete(entity);
    }
}
