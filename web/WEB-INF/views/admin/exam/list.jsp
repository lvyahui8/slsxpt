${action.registStyle("js/zurb-responsive-tables/responsive-tables.css")}

${action.registScript("js/zurb-responsive-tables/responsive-tables.js")}

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>

<div class="page-container">
    <%@ include file="../../layouts/admin/menu.jsp" %>

    <div class="main-content">
        <%@ include file="../../layouts/admin/top.jsp" %>
        <ol class="breadcrumb bc-3">
            <li>
                <a href="${baseUrl}/admin"><i class="fa-home"></i>Home</a>
            </li>
            <li class="active">所有试题</li>
        </ol>
        <div class="row">
            <div class="col-sm-3">
                <p>
                    <a class="btn btn-blue" href="${baseUrl}/admin/exam-save.action">新建</a>
                </p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-condensed table-bordered table-hover table-striped" id="table-exams">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>题干</th>
                        <th>题目类型</th>
                        <th>浏览人数</th>
                        <th>测试人数</th>
                        <th>栏目</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="pageData.datas" var="exam">
                        <tr class="">
                            <td><s:property value="id"/></td>
                            <td><s:property value="title"/></td>
                            <td><s:property value="cnTestType"/> </td>
                            <td><s:property value="viewCount"/></td>
                            <td class=""><s:property value="testCount"/></td>
                            <td><s:property value="category.name"/></td>
                            <td>
                                <a href="${baseUrl}/admin/exam-save.action?id=${id}"
                                   class="btn btn-default btn-xs btn-icon icon-left">
                                    <i class="entypo-pencil"></i>
                                    编辑
                                </a>
                                <a href="${baseUrl}/admin/exam-delete.action?id=${id}"
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

        <%@include file="../../layouts/pagination.jsp"%>

        <%@ include file="../../layouts/admin/bottom.jsp" %>
    </div>
</div>
<%@ include file="../../layouts/admin/footer.jsp" %>
