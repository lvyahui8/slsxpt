<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-6-17
  Time: 下午11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>${title}</title>
</head>
<body>
<s:if test="#session.loginUser != null">
    <a href="${baseUrl}/site-logout.action">退出</a>
</s:if>
<s:else>
    <a href="${baseUrl}/site-login.action">登陆</a> <a href="${baseUrl}/site-register.action">注册</a>
</s:else>

<ul class="dd-list">
    <s:iterator value="#session.topCategorys" var="topCategory">
        <li class="dd-item" data-id="${topCategory.id}">
            <div class="dd-content">
                <s:property value="#topCategory.name"/>
            </div>
            <s:if test="#topCategory.childrens.size() > 0">
                <ul class="dd-list">
                    <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                        <li class="dd-item" data-id="${childCategoryl1.id}">
                            <div class="dd-content">
                                <s:property value="#childCategoryl1.name"/>
                                <div class="pull-right">${childCategoryl1.cnType}</div>
                            </div>
                            <s:if test="#childCategoryl1.childrens.size() > 0">
                                <ul class="dd-list">
                                    <s:iterator value="#childCategoryl1.childrens" var="childCategoryl2">
                                        <li class="dd-item" data-id="${childCategoryl2.id}">
                                            <div class="dd-content">
                                                <s:property value="#childCategoryl2.name"/>
                                            </div>
                                        </li>
                                    </s:iterator>
                                </ul>
                            </s:if>
                        </li>
                    </s:iterator>
                </ul>
            </s:if>
        </li>
    </s:iterator>
</ul>
<s:debug/>
</body>
</html>
