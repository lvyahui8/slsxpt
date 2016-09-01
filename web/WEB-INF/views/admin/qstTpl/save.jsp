<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/15
  Time: 10:01
  To change this template use File | Settings | File Templates.
--%>

${action.registScript('js/qst-tpl.js')}
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                <strong>编辑问答模板</strong>
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
                      action="${baseUrl}/admin/qstTpl-postSave.action">
                    <input type="hidden" name="id" value="${qstTpl.id}"/>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">名称</label>
                        <div class="col-sm-5">
                            <input type="text" name="name" id="name" class="form-control"
                                   value="${qstTpl.name}" placeholder=""
                                   data-validate="required" data-message-required="必须填写">
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-3 control-label">模板项</label>
                        <div class="col-sm-5">
                            <div id="qstTpl-items" data-prefix="items">
                                <s:if test="qstTpl.items.size() > 0">
                                    <s:iterator begin="0" end="qstTpl.items.size() - 1" step="1" var="i">
                                        <div class="qstTpl-item">
                                            <div class='input-group'>
                                                <input class="form-control title" name="items[${i}].title" placeholder="" value="${qstTpl.items[i].title}">
                                                <span class="input-group-btn"><a class="btn btn-danger qstTpl-del">删除</a></span>
                                            </div>
                                            <input class="form-control answer" name="items[${i}].answer" placeholder="" value="${qstTpl.items[i].answer}">
                                            <br/>
                                        </div>
                                    </s:iterator>
                                </s:if>
                                <s:else>
                                    <div class="qstTpl-item">
                                        <div class='input-group'>
                                            <input class="form-control title" name="items[0].title" placeholder="" value="">
                                            <span class="input-group-btn"><a class="btn btn-danger qstTpl-del">删除</a></span>
                                        </div>
                                        <input class="form-control answer" name="items[0].answer" placeholder="" value="">
                                        <br/>
                                    </div>
                                </s:else>
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
<%@ include file="../../layouts/admin/footer.jsp" %>