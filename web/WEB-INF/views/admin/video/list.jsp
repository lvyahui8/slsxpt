
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>

<div class="page-container">
    <%@ include file="../../layouts/admin/menu.jsp"%>

    <div class="main-content">
        <%@ include file="../../layouts/admin/top.jsp"%>
        <ol class="breadcrumb bc-3" >
            <li>
                <a href="${baseUrl}/admin"><i class="fa-home"></i>Home</a>
            </li>
            <li class="active">所有视频</li>
        </ol>
        <div class="row">
            <div class="col-sm-3">
                <p><a href="${baseUrl}/admin/video-save.action" class="btn btn-blue">新建</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-condensed table-bordered table-hover table-striped" id="table-exams">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>缩略图</th>
                        <th>标题</th>
                        <th>说明</th>
                        <th>浏览人数</th>
                        <th>测试人数</th>
                        <th>栏目</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="pageData.datas" var="videol">
                        <tr class="">
                            <td><s:property value="id"/> </td>
                            <td><img src="${thumbnail}" alt="${title}" width="40" height="30"/></td>
                            <td><s:property value="title"/> </td>
                            <td><s:property value="content"/> </td>
                            <td><s:property value="viewCount"/> </td>
                            <td class=""><s:property value="testCount"/></td>
                            <td><s:property value="category.name"/> </td>
                            <td>
                                <a href="${baseUrl}/admin/video-save.action?id=${id}" class="btn btn-default btn-xs btn-icon icon-left">
                                    <i class="entypo-pencil"></i>
                                    编辑
                                </a>
                                <a href="${baseUrl}/admin/video-delete.action?id=${id}" class="btn btn-danger btn-xs btn-icon icon-left">
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
        <%@ include file="../../layouts/admin/bottom.jsp"%>
    </div>
</div>
<%@ include file="../../layouts/admin/footer.jsp" %>

