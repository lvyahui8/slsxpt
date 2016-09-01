package org.lyh.app.services;

import org.apache.struts2.json.JSONException;
import org.apache.struts2.json.JSONUtil;
import org.lyh.app.daos.ExamQstDao;
import org.lyh.app.entitys.*;
import org.lyh.library.SiteHelpers;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2015/7/1.
 */
@Service
@Transactional
public class ExamService extends ProjectService<ExamEntity> {

    private ExamQstDao examQstDao ;

    public void setExamQstDao(ExamQstDao examQstDao) {
        this.examQstDao = examQstDao;
    }

    @Override
    public Integer add(ExamEntity exam) {
        CategoryEntity category = categoryDao.get(exam.getCategoryId());
        if(category != null){
            exam.setCategory(category);
        }
        if("qa".equals(exam.getTestType())){
            for(ExamQstEntity examQstEntity : exam.getQuestions()){
                examQstEntity.setExam(exam);
            }
        }
        else{
            exam.getQuestions().clear();
            try {
                exam.setAnswer(JSONUtil.serialize(exam.getAnswers()));
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        UserEntity loginUser = getLoginUser();
        exam.setUser(loginUser);
        return baseDao.save(exam);
    }

    @Override
    public void update(ExamEntity exam) {
        ExamEntity existExam =  this.baseDao.get(exam.getId());
        existExam.setTitle(exam.getTitle());
        existExam.setAnswer(exam.getAnswer());
        existExam.setContent(exam.getContent());
        if(exam.getCategoryId() != null  && !existExam.getCategory().getId().equals(exam.getCategoryId())){
            System.out.println("修改了试题分类");
            CategoryEntity newCategory = categoryDao.get(exam.getCategoryId());
            existExam.setCategory(newCategory);
        }
        if("qa".equals(exam.getTestType())){
            this.examQstDao.delete("exam_id",exam.getId());
            for (ExamQstEntity examQstEntity : exam.getQuestions()){
                existExam.getQuestions().add(examQstEntity);
                examQstEntity.setExam(existExam);
            }
        }else{
            try {
                existExam.setAnswer(JSONUtil.serialize(exam.getAnswers()));
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        existExam.setTestType(exam.getTestType());
        baseDao.save(existExam);
    }

    @Override
    public boolean delete(ExamEntity entity) {
        this.examQstDao.delete("exam_id",entity.getId());
        this.baseDao.delete(entity);
        return true;
    }

    @Override
    public void handleEntity(ExamEntity existEntity) {
        super.handleEntity(existEntity);
        if(!existEntity.getTestType().equals("qa")){
            try {
                Map<String,Object> data = (Map<String, Object>) JSONUtil.deserialize(existEntity.getAnswer());
                existEntity.getAnswers().getRight().addAll((List<Long>)data.get("right"));
                existEntity.getAnswers().getItems().addAll((List<String>)data.get("items"));
                SiteHelpers.p("handleEntity:"+existEntity);
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
}
