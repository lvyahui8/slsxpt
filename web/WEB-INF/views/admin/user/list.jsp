
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
                <a href="${baseUrl}/admin"><i class="fa-home"></i>Home</a>
            </li>
            <li class="active">所有用户</li>
        </ol>
        <h3><span class="label label-warning">用户</span></h3>
        <br />
        <div class="row">
            <div class="col-sm-12">
                <table class="table table-condensed table-bordered table-hover table-striped" id="table-exams">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>用户名</th>
                        <th>邮箱</th>
                        <th>昵称</th>
                        <th>金币</th>
                        <th>进度</th>
                        <th>电话</th>
                        <th>类型</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <s:iterator value="pageData.datas" var="user">
                        <tr class="">
                            <td><s:property value="id"/> </td>
                            <td>${username}</td>
                            <td>${email}</td>
                            <td>${name} </td>
                            <td>${gold} </td>
                            <td class="">${progress}</td>
                            <td>${phone} </td>
                            <td>${type} </td>
                            <td>
                                <a href="${baseUrl}/admin/user-save.action?id=${id}" class="btn btn-default btn-xs btn-icon icon-left">
                                    <i class="entypo-pencil"></i>
                                    编辑
                                </a>
                                <a href="${baseUrl}/admin/user-delete.action?id=${id}" class="btn btn-danger btn-xs btn-icon icon-left">
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

        <s:if test="pageData.totalPage > 1">
            <div class="row">
                <div class="col-sm-3">
                    <span class="mt15 mb15"> ${pageData.currentPage}/${pageData.totalPage},${pageData.totalItem}</span>
                </div>
                <div class="col-sm-9">
                    <ul class="pagination pull-right">
                        <s:if test="pageData.currentPage == 1">
                            <li class='disabled'>
                                <a href="#"><i class="entypo-left-open-mini"></i></a>
                            </li>
                        </s:if>
                        <s:else>
                            <li>
                                <a href="${baseUrl}/admin/user-list.action?currentPage=${pageData.currentPage-1}"><i class="entypo-left-open-mini"></i></a>
                            </li>
                        </s:else>
                        <s:iterator begin="pageData.start" step="1" end="pageData.end" var="i">
                            <li ${pageData.currentPage == i ? "class='active'" : null}>
                                <a href="${baseUrl}/admin/user-list.action?currentPage=${i}">${i}</a>
                            </li>
                        </s:iterator>
                        <s:if test="pageData.currentPage == pageData.totalPage">
                            <li class='disabled'>
                                <a href="#"><i class="entypo-right-open-mini"></i></a>
                            </li>
                        </s:if>
                        <s:else>
                            <li>
                                <a href="${baseUrl}/admin/user-list.action?currentPage=${pageData.currentPage+1}"><i class="entypo-right-open-mini"></i></a>
                            </li>
                        </s:else>
                    </ul>
                </div>
            </div>

        </s:if>

        <%@ include file="../../layouts/admin/bottom.jsp"%>
    </div>


</div>
</body>
<%@ include file="../../layouts/admin/footer.jsp" %>
