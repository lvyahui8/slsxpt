<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/21
  Time: 13:44
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<section class="blog" style="padding-top: 0px">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div class="palyer">
                    <video src="${video.resourceUrl}" width="100%"  height = "56.25%"
                        controls="controls">
                    </video>
                </div>
                <div>
                    <s:if test="video.questions.size() > 0">
                        <s:iterator begin="0" end="video.questions.size() - 1" step="1" var="i">
                            <div class="form-group">
                                <label  class="">${video.questions[i].title} </label>
                                <input type="text" name="" class="form-control" value=""/>
                            </div>
                        </s:iterator>
                    </s:if>
                </div>
                <%@include file="../layouts/comments.jsp"%>
            </div>
        </div>
        <%@ include file="../layouts/nav.jsp" %>
    </div>
    <br/>
</section>
<%@ include file="../layouts/footer.jsp" %>
