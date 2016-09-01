
${action.registStyle("js/selectboxit/jquery.selectBoxIt.css")}
${action.registStyle("js/wysihtml5/bootstrap-wysihtml5.css")}

${action.registScript("js/selectboxit/jquery.selectBoxIt.min.js")}
${action.registScript("js/wysihtml5/wysihtml5-0.4.0pre.min.js")}
${action.registScript("js/wysihtml5/bootstrap-wysihtml5.js")}

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
                <a href="${baseUrl}/admin/article-list.action">所有文章</a>
            </li>
            <li class="active">
                <strong><s:if test="article.id != null">修改</s:if>新建<s:else></s:else>文章</strong>
            </li>
        </ol>


        <form method="post" role="form" action="${baseUrl}/admin/article-postSave.action">
            <input type="text" name="id" hidden="hidden" value="${article.id}"/>
            <div class="row">
                <div class="col-sm-2 post-save-changes">
                    <button type="submit" class="btn btn-green  btn-block btn-icon">
                        保存
                        <i class="entypo-check"></i>
                    </button>
                </div>

                <div class="col-sm-10">
                    <div class="col-sm-8">
                        <input type="text" class="form-control " name="title" value="${article.title}" placeholder="Post title" />
                    </div>
                    <div class="col-sm-4">
                        ${action.categorySelector("article",article.category.id)}
                    </div>
                </div>

            </div>

            <br />

            <div class="row">
                <div class="col-sm-12">
          <textarea class="form-control wysihtml5" rows="32"
                    data-stylesheet-url="${baseUrl}/assets/css/wysihtml5-color.css"
                    name="content" id="content">${article.content}</textarea>
                </div>
            </div>

        </form>
        <%@ include file="../../layouts/admin/bottom.jsp"%>
    </div>

</div>
<%@ include file="../../layouts/admin/footer.jsp" %>
