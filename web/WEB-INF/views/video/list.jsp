<%@ taglib prefix="c" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: 浩
  Date: 2015/10/5
  Time: 16:37
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<!--中部-->
<section >
    <div class="container">
        <div class="row" id="portfolio-items">
            <s:iterator begin="0" end="pageData.getDatas().size() - 1"  step="1" var="i">
            <div class="item col-sm-4 col-xs-6 filter-design">
                <div class="portfolio-item">
                    <a href="${baseUrl}/video-view.action?id=${pageData.getDatas().get(i).id}" class="image" title="${pageData.getDatas().get(i).title}">
                        <img src="${pageData.getDatas().get(i).thumbnail}" class="img-rounded" />
                        <span class="hover-zoom"></span>
                    </a>
                    <h4>
                        <a href="#" class="like">
                            <i class="entypo-heart"></i>
                        </a>
                        <a href="#" class="name">${pageData.getDatas().get(i).shortTitle}</a>
                    </h4>
                    <div class="categories">
                        <a href="#">${pageData.getDatas().get(i).content}</a>
                    </div>
                </div>
            </div>
            </s:iterator>
        </div>
        <%@include file="../layouts/pagination.jsp"%>
    </div>
    <br/>
</section>
<%@ include file="../layouts/footer.jsp" %>

