<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/15
  Time: 9:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>
<div class="page-container">
    <%@ include file="../../layouts/admin/menu.jsp"%>
    <div class="main-content">
        <%@ include file="../../layouts/admin/top.jsp"%>
        <ol class="breadcrumb bc-3">
            <li>
                <a href="${baseUrl}/admin"><i class="fa-home"></i>Home</a>
            </li>
            <li class="active">所有试题</li>
        </ol>
        <div class="row">
            <div class="col-sm-3">
                <p><a href="${baseUrl}/admin/qstTpl-save.action" class="btn btn-blue">新建</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-condensed table-bordered table-hover table-striped" id="table-qstTpl">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>模板名称</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="pageData.datas" var="qstTpl">
                        <tr class="">
                            <td><s:property value="id"/></td>
                            <td><s:property value="name"/></td>
                            <td>
                                <a href="${baseUrl}/admin/qstTpl-save.action?id=${id}"
                                   class="btn btn-default btn-xs btn-icon icon-left">
                                    <i class="entypo-pencil"></i>
                                    编辑
                                </a>
                                <a href="${baseUrl}/admin/qstTpl-delete.action?id=${id}"
                                   class="btn btn-danger btn-xs btn-icon icon-left">
                                    <i class="entypo-cancel"></i>
                                    删除
                                </a>
                            </td>
                        </tr>
                    </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
        <%@ include file="../../layouts/pagination.jsp"%>
        <%@ include file="../../layouts/admin/bottom.jsp"%>
    </div>
</div>
<%@ include file="../../layouts/admin/footer.jsp" %>