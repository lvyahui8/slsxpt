<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/21
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
${action.registStyle('css/audioplayer.css')}
${action.registScript('js/audioplayer.js')}
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<section class="blog" style="padding-top: 0px">
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div class="body">
                    <h3>${audio.title}</h3>
                    <p>${audio.content}</p>
                    <audio preload="auto" src="${audio.resourceUrl}" class="audioPlayer" controls="controls" volume="0.3"></audio>
                    <br/>
                </div>
                <div>
                    <s:if test="audio.questions.size() > 0">
                        <s:iterator begin="0" end="audio.questions.size() - 1" step="1" var="i">
                            <div class="form-group">
                                <label  class="">${audio.questions[i].title} </label>
                                <input type="text" name="" class="form-control" value=""/>
                            </div>
                        </s:iterator>
                    </s:if>
                </div>
                <%@include file="../layouts/comments.jsp"%>
                <%@ include file="../layouts/nav.jsp" %>
            </div>
        </div>
    </div>
    <br/>
</section>
<%@ include file="../layouts/footer.jsp" %>

