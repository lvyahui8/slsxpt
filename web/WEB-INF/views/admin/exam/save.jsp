<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/7/1
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>


${requestScope._this.registStyle("js/selectboxit/jquery.selectBoxIt.css")}
${requestScope._this.registStyle("js/wysihtml5/bootstrap-wysihtml5.css")}

${requestScope._this.registScript("js/jquery.form.min.js")}
${requestScope._this.registScript("js/jquery.validate.min.js")}
${requestScope._this.registScript("js/exam.js")}

${requestScope._this.registScript("js/selectboxit/jquery.selectBoxIt.min.js")}
${requestScope._this.registScript("js/wysihtml5/wysihtml5-0.4.0pre.min.js")}
${requestScope._this.registScript("js/wysihtml5/bootstrap-wysihtml5.js")}

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>

<body class="page-body" data-url="">
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
                <div class="panel-title">编辑试题<small><code>ddd</code></small></div>

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
                    <input type="text" name="id" value="${project.id}" hidden="hidden"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">栏目</label>
                        <div class="col-sm-5">
                            <select name="category_id" class="selectboxit"
                                    data-validate="required" data-message-required="必须选择栏目">
                                <s:iterator value="#session.topCategorys" var="topCategory">
                                    <s:if test='#topCategory.type == "exam"'>
                                        <option value="${topCategory.id}" ${topCategory.id == project.category.id ? "selected" : ""}>${topCategory.name}</option>
                                    </s:if>
                                    <s:if test="#topCategory.childrens.size() > 0">
                                        <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                                            <s:if test='#childCategoryl1.type == "exam"'>
                                                <option value="${childCategoryl1.id}" ${childCategoryl1.id == project.category.id ? "selected" : ""}>--${childCategoryl1.name}</option>
                                            </s:if>
                                            <s:if test="#childCategoryl1.childrens.size() > 0">
                                                <s:iterator value="#childCategoryl1.childrens" var="childCategoryl2">
                                                    <s:if test='#childCategoryl2.type == "exam"'>
                                                        <option value="${childCategoryl2.id}" ${childCategoryl2.id == project.category.id ? "selected" : ""}>----${childCategoryl2.name}</option>
                                                    </s:if>
                                                </s:iterator>
                                            </s:if>
                                        </s:iterator>
                                    </s:if>
                                </s:iterator>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">题干</label>
                        <div class="col-sm-5">
                            <input type="text" name="title" id="title" class="form-control" value="${project.title}" placeholder=""
                                   data-validate="required" data-message-required="题干必须填写">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">补充</label>
                        <div class="col-sm-5">
              <textarea class="form-control wysihtml5" data-stylesheet-url="${baseUrl}/assets/css/wysihtml5-color.css"
                        name="content" id="content">${project.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <input type="text" hidden="hidden" name="answer" value="${project.answer}"/>
                        <label class="col-sm-3 control-label">答案</label>
                        <div class="col-sm-5">
                            <s:if test="answers != null" >
                                <%--var 属性将变量放到 stack Content上面，并且放到了栈顶，可以直接访问属性--%>
                                <s:iterator value="answers" var="answerItem">
                                    <div class="input-group answer-group">
                        <span class="input-group-addon">
                            <input type="checkbox" class="isAnswer" ${answer ? "checked" : ""}/>
                        </span>
                                        <input type="text" class="form-control answerItem" placeholder="" value="${text}">
                                    </div>
                                    <br/>
                                </s:iterator>
                                <s:if test="answers.size() < 4">
                                    <s:iterator begin="answers.size()" step="1" end="3">
                                        <div class="input-group answer-group">
                                <span class="input-group-addon">
                                    <input type="checkbox" class="isAnswer"/>
                                </span>
                                            <input type="text" class="form-control answerItem" placeholder="">
                                        </div>
                                        <br/>
                                    </s:iterator>
                                </s:if>
                            </s:if>
                            <s:else>
                                <s:iterator begin="1" step="1" end="4">
                                    <div class="input-group answer-group">
                        <span class="input-group-addon">
                            <input type="checkbox" class="isAnswer"/>
                        </span>
                                        <input type="text" class="form-control answerItem" placeholder="">
                                    </div>
                                    <br/>
                                </s:iterator>
                            </s:else>
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
</body>
<%@ include file="../../layouts/admin/footer.jsp" %>