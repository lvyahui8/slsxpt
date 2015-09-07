package org.lyh.app.actions.admin;

import com.opensymphony.xwork2.ActionContext;
import org.lyh.app.entitys.ProjectEntity;
import org.lyh.app.services.ExamService;

import java.util.List;
import java.util.Map;

/**
 * Created by admin on 2015/7/1.
 */
public class ExamAction
        extends ProjectAction
{
    @Override
    public void tranProject(ProjectEntity project) {
        if(project.getAnswer()!=null){
            List<Map<String,Object>> answers = ((ExamService)projectService).transAnswers(project.getAnswer());
            if(answers != null){
                ActionContext.getContext().getValueStack().set("answers",answers);
            }
        }
    }
}
