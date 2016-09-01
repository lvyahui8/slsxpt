<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/20
  Time: 22:45
  To change this template use File | Settings | File Templates.
--%>
${action.registStyle('js/icheck/skins/minimal/_all.css')}
${action.registScript('js/icheck/icheck.min.js')}
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<section>
    <div class="container">
        <div class="row">
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-12">
                        <h3>${exam.title}?<small>&nbsp;${exam.cnTestType}</small></h3>
                        <p>${exam.content}</p>
                    </div>
                </div>
                <div class="row">
                    <form action="${baseUrl}">
                        <div class="col-sm-12">
                            <s:if test="exam.testType != 'qa'">
                                <%--选择题--%>
                                <s:iterator value="exam.answers.items" var="item">
                                    <div class="radio">
                                        <label>
                                            <input type='${exam.testType =="single" ? "radio" : "checkbox"}'
                                                   name="answer" class="iCheck"/>
                                                ${item}
                                        </label>
                                    </div>
                                </s:iterator>
                            </s:if>
                            <s:else>
                                <s:iterator value="exam.questions" var="qst">
                                    <div class="form-group">
                                        <label>${qst.title}</label>
                                        <input type="text" class="form-control"/>
                                    </div>
                                </s:iterator>
                            </s:else>
                        </div>
                    </form>
                </div>
                <br/>
                <br/>
                <br/>
                <%@ include file="../layouts/nav.jsp" %>
            </div>
        </div>
    </div>
    <br/>
</section>
<%@ include file="../layouts/footer.jsp" %>
