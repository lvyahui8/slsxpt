<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2015/7/12
  Time: 18:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <s:iterator value="audios" var="audio">
                    <div class="alert alert-warning">
                        <div class="row">
                            <a href="${baseUrl}/audio-view.action?id=${id}">
                                <div class="col-sm-12">
                                    <span class="pull-left">
                                        <h4>${title}</h4>
                                    </span>
                                </div>
                                <div class="col-sm-8">
                                        <p>${content}</p>
                                </div>
                                <div class="col-sm-4">
                                    <p class="pull-right">
                                        ${createdAt}
                                    </p>
                                </div>
                            </a>

                        </div>
                    </div>
                </s:iterator>
            </div>
        </div>
    </div>
    <br/>
</section>
<%@ include file="../layouts/footer.jsp" %>
