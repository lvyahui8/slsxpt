
${requestScope._this.registStyle("js/selectboxit/jquery.selectBoxIt.css")}
${requestScope._this.registStyle("js/wysihtml5/bootstrap-wysihtml5.css")}

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
                <a href="${baseUrl}/admin/article-list.action">所有文章</a>
            </li>
            <li class="active">
                <strong><s:if test="#project != null">修改</s:if>新建<s:else></s:else>文章</strong>
            </li>
        </ol>


        <form method="post" role="form" action="${baseUrl}/admin/article-postSave.action">
            <input type="text" name="id" hidden="hidden" value="${project.id}"/>
            <div class="row">
                <div class="col-sm-2 post-save-changes">
                    <button type="submit" class="btn btn-green  btn-block btn-icon">
                        保存
                        <i class="entypo-check"></i>
                    </button>
                </div>

                <div class="col-sm-10">
                    <div class="col-sm-8">
                        <input type="text" class="form-control " name="title" value="${project.title}" placeholder="Post title" />
                    </div>
                    <div class="col-sm-4">
                        <select name="category_id" class="selectboxit">
                            <s:iterator value="#session.topCategorys" var="topCategory">
                                <s:if test='#topCategory.type == "article"'>
                                    <option value="${topCategory.id}"
                                        ${topCategory.id == project.category.id ? "selected" : ""}>${topCategory.name}</option>
                                </s:if>
                                <s:if test="#topCategory.childrens.size() > 0">
                                    <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                                        <s:if test='#childCategoryl1.type == "article"'>
                                            <option value="${childCategoryl1.id}"
                                                ${childCategoryl1.id == project.category.id ? "selected" : ""}>--${childCategoryl1.name}</option>
                                        </s:if>
                                        <s:if test="#childCategoryl1.childrens.size() > 0">
                                            <s:iterator value="#childCategoryl1.childrens" var="childCategoryl2">
                                                <s:if test='#childCategoryl2.type == "article"'>
                                                    <option value="${childCategoryl2.id}"
                                                        ${childCategoryl2.id == project.category.id ? "selected" : ""}>----${childCategoryl2.name}</option>
                                                </s:if>
                                            </s:iterator>
                                        </s:if>
                                    </s:iterator>
                                </s:if>
                            </s:iterator>
                        </select>
                    </div>
                </div>

            </div>

            <br />

            <div class="row">
                <div class="col-sm-12">
          <textarea class="form-control wysihtml5" rows="32"
                    data-stylesheet-url="${baseUrl}/assets/css/wysihtml5-color.css"
                    name="content" id="content">${project.content}</textarea>
                </div>
            </div>

        </form>


        <%@ include file="../../layouts/admin/bottom.jsp"%>
    </div>

</div>
</body>
<%@ include file="../../layouts/admin/footer.jsp" %>
