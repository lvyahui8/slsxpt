<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/21
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<section  class="blog blog-single">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div class="blog-post-single">
                    <div class="post-details">

                        <h3>
                            ${article.title}
                        </h3>

                        <div class="post-meta">

                            <div class="meta-info">
                                <i class="entypo-calendar"></i> ${article.createdAt}</div>

                            <div class="meta-info">
                                <i class="entypo-comment"></i>
                                0 评论
                            </div>

                        </div>

                    </div>


                    <div class="post-content">
                        ${article.content}
                    </div>
                    <br />
                    <%@include file="../layouts/comments.jsp"%>
                </div>
                <%@ include file="../layouts/nav.jsp" %>
            </div>
        </div>
    </div>
</section>
<%@ include file="../layouts/footer.jsp" %>