<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/7/1
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>


${action.registStyle("js/selectboxit/jquery.selectBoxIt.css")}
${action.registStyle("js/wysihtml5/bootstrap-wysihtml5.css")}

${action.registScript("js/jquery.form.min.js")}
${action.registScript("js/jquery.validate.min.js")}
${action.registScript("js/exam.js")}

${action.registScript("js/selectboxit/jquery.selectBoxIt.min.js")}
${action.registScript("js/wysihtml5/wysihtml5-0.4.0pre.min.js")}
${action.registScript("js/wysihtml5/bootstrap-wysihtml5.js")}
${action.registScript('js/qst-tpl.js')}

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>

<div class="page-container">
    <%@ include file="../../layouts/admin/menu.jsp"%>

    <div class="main-content">
        <%@ include file="../../layouts/admin/top.jsp"%>
        <ol class="breadcrumb bc-3" >
            <li>
                <a href="${baseUrl}/admin/index.action"><i class="fa-home"></i>Home</a>
            </li>
            <li>
                <a href="${baseUrl}/admin/exam-list.action">试题列表</a>
            </li>
            <li class="active">
                <strong>编辑试题</strong>
            </li>
        </ol>
        <div class="panel panel-primary">

            <div class="panel-heading">
                <div class="panel-title">编辑试题<small><code></code></small></div>

                <div class="panel-options">
                    <a href="#sample-modal" data-toggle="modal" data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
                    <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                    <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                    <a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" id="form-exam" method="post" class="form-horizontal validate debug"
                      action="${baseUrl}/admin/exam-postSave.action">
                    <%-- 隐藏子段--%>
                    <input type="text" name="id" value="${exam.id}" hidden="hidden"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">栏目</label>
                        <div class="col-sm-5">
                            ${action.categorySelector("exam",exam.category.id)}
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">问题</label>
                        <div class="col-sm-5">
                            <input type="text" name="title" id="title" class="form-control"
                                   value="${exam.title}" placeholder=""
                                   data-validate="required" data-message-required="题干必须填写">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">补充</label>
                        <div class="col-sm-5">
                            <textarea class="form-control wysihtml5"
                                      rows="30"
                                      data-stylesheet-url="${baseUrl}/assets/css/wysihtml5-color.css"
                                      name="content" id="content">${exam.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group type-radio">
                        <label  class="col-sm-3 control-label">类型</label>
                        <div class="col-sm-5">
                            <div class="radio radio-replace radio-inline">
                                <input type="radio" name="testType"
                                ${exam.testType == "single" ? "checked" : exam.id == null ? "checked" : null} value="single">
                                <label>单选题</label>
                            </div>
                            <div class="radio radio-replace radio-inline">
                                <input type="radio" name="testType"
                                ${exam.testType == "multiple" ? "checked" : null}  value="multiple">
                                <label>多选题</label>
                            </div>
                            <div class="radio radio-replace radio-inline">
                                <input type="radio" name="testType"
                                ${exam.testType == "qa" ? "checked" : null}  value="qa">
                                <label>问答题</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" hidden="hidden" name="answer" value="${exam.answer}"/>
                        <label class="col-sm-3 control-label">答案</label>
                        <div class="col-sm-5" id="select-container" style='${exam.id != null && exam.testType == "qa" ? "display:none" : null}'>
                            <s:if test="exam.answers.items.size() > 0" >
                                <s:iterator begin="0" step="1" end="exam.answers.items.size()-1" var="i">
                                    <div class="input-group answer-group">
                                        <span class="input-group-addon">
                                            <input type='${exam.testType =="single" ? "radio" : "checkbox"}'
                                                   name="answers.right"
                                                   class="isAnswer" ${exam.answers.isRight(i) ? "checked" : ""} value="${i}"/>
                                        </span>
                                        <input type="text" class="form-control answerItem"
                                               name="answers.items[${i}]"
                                               placeholder="" value="${exam.answers.items.get(i)}">
                                    </div>
                                    <br/>
                                </s:iterator>
                            </s:if>
                            <s:if test="exam.answers.items.size() < 4">
                                <s:iterator begin="exam.answers.items.size()" step="1" end="3" var="i">
                                    <div class="input-group answer-group">
                                            <span class="input-group-addon">
                                                <input type='${exam.testType == "single" || exam.testType == null ? "radio" : "checkbox"}'
                                                       name="answers.right" class="isAnswer" value="${i}"/>
                                            </span>
                                        <input type="text" class="form-control answerItem" name="answers.items[${i}]">
                                    </div>
                                    <br/>
                                </s:iterator>
                            </s:if>
                        </div>
                        <div class="col-sm-5" id="qa-container" style='${exam.testType != "qa" ? "display:none" : null}'>
                            <div id="qstTpl-items" data-load="${exam.category.qstTplId}" data-prefix="questions">
                                <s:if test="exam.questions.size() > 0">
                                    <s:iterator begin="0" step="1" end="exam.questions.size()-1" var="i">
                                        <div class="qstTpl-item">
                                            <div class="input-group">
                                                <input class="form-control title" name="questions[${i}].title"  value="${exam.questions[i].title}">
                                                <span class="input-group-btn"><a class="btn btn-danger qstTpl-del">删除</a></span>
                                            </div>
                                            <input class="form-control answer" name="questions[${i}].answer" value="${exam.questions[i].answer}">
                                            <br>
                                        </div>
                                    </s:iterator>
                                </s:if>
                                <s:elseif test="exam.category.qstTplId == null ||  exam.category.qstTplId == ''">
                                    <div class="qstTpl-item">
                                        <div class="input-group">
                                            <input class="form-control title" name="questions[0].title" >
                                            <span class="input-group-btn"><a class="btn btn-danger qstTpl-del">删除</a></span>
                                        </div>
                                        <input class="form-control answer" name="questions[0].answer" value="">
                                        <br>
                                    </div>
                                </s:elseif>
                            </div>
                            <a class="btn btn-primary pull-right" id="qstTpl-add">添加</a>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"></label>
                        <div class="col-sm-5">
                            <button type="submit" class="btn btn-blue btn-block">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%@ include file="../../layouts/admin/bottom.jsp"%>
    </div>
</div>
<script>
    $(document).ready(function () {
        var count = 0;
        $('#form-exam input[name="testType"]').change(function () {
            var $this = $(this),
                    val = $this.val(),
                    select = function(){
                        $('#qa-container').hide();
                        $('#select-container').show();
                    },
                    qa = function(){
                        $('#select-container').hide();
                        $('#qa-container').show();
                    };
            if(++count < 4) return;
            if(val==='single'){
                select();
                $('#form-exam input[name="answers.right"]').attr('type','radio');
            }else if(val === 'multiple'){
                select();
                $('#form-exam input[name="answers.right"]').attr('type','checkbox');
            }else if(val === 'qa'){
                qa();
            }
        });
    });
</script>
<%@ include file="../../layouts/admin/footer.jsp" %>