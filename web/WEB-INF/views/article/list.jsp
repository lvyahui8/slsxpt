<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-7-7
  Time: 上午10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<section class="blog">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <s:iterator value="articles" var="article">
                    <div class="blog-posts">
                        <div class="blog-post">
                            <div class="post-thumb">

                                <a href="${baseUrl}/article-view.action?id=${id}">
                                    <img src="${assets}/fg/images/blog-thumb-1.png" class="img-rounded" />
                                    <span class="hover-zoom"></span>
                                </a>

                            </div>
                            <div class="post-details">
                                <h3>
                                    <a href="${baseUrl}/article-view.action?id=${id}">${title}</a>
                                </h3>
                                <div class="post-meta">
                                    <div class="meta-info">
                                        <i class="entypo-calendar"></i> ${createdAt}
                                    </div>
                                    <div class="meta-info">
                                        <i class="entypo-comment"></i>
                                        0 评论
                                    </div>
                                </div>
                                <p>
                                    ${description}
                                </p>
                            </div>
                        </div>
                    </div>
                </s:iterator>
            </div>
        </div>
        <%@include file="../layouts/pagination.jsp"%>
    </div>
    <br/>
</section>
<%@ include file="../layouts/footer.jsp" %>
