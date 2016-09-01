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
<section>
    <div class="container">
        <div class="row">
            <s:iterator value="exams" var="exam">
                <div class="col-sm-3">
                    <a href="${baseUrl}/exam-view.action?id=${id}">
                        <div class="alert alert-warning">
                            <h5>知识点：#${id}</h5>
                            <hr/>
                            <p>${title}</p>
                        </div>
                    </a>
                </div>
            </s:iterator>
        </div>
        <%@include file="../layouts/pagination.jsp"%>
    </div>
</section>
<%@ include file="../layouts/footer.jsp" %>
