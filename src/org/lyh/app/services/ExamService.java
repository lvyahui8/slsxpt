package org.lyh.app.services;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.lyh.app.entitys.CategoryEntity;
import org.lyh.app.entitys.ProjectEntity;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2015/7/1.
 */
@Service
@Transactional
public class ExamService extends ProjectService {

    @Override
    public void add(ProjectEntity examItem) {
        examItem.setType("exam");
        System.out.println(examItem);
        CategoryEntity category = categoryDao.get(examItem.getCategory_id());
        System.out.println(category);
        if(category != null){
            examItem.setCategory(category);
        }
        projectDao.save(examItem);
    }

    @Override
    public void update(ProjectEntity examItem) {
        ProjectEntity existExamItem =  this.projectDao.get(examItem.getId());
        existExamItem.setTitle(examItem.getTitle());
        existExamItem.setAnswer(examItem.getAnswer());
        existExamItem.setContent(examItem.getContent());
        if(examItem.getCategory_id() != null  && existExamItem.getCategory().getId() != examItem.getCategory_id()){
            CategoryEntity categoryEntity = categoryDao.get(examItem.getCategory_id());
            existExamItem.setCategory(categoryEntity);
        }
        projectDao.save(existExamItem);
    }

    public List<Map<String, Object>> transAnswers(String answer) {
        try {
            return (List<Map<String, Object>>) JSONUtil.deserialize(answer);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }
}
