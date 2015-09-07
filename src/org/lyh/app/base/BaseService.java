package org.lyh.app.base;

import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

/**
 * Created by lvyahui on 2015-06-17.
 */
@Service
@Transactional
public class BaseService<T> {
    protected BaseDao thisDao;

    public void setThisDao(BaseDao thisDao) {
        this.thisDao = thisDao;
    }





}
