<%--
  Created by IntelliJ IDEA.
  User: 浩
  Date: 2015/11/28
  Time: 21:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div style="float: left ;width:60px;">
  <s:if test="entity.prev != null">
    <a href="${baseUrl}/${actionName}-view.action?id=${entity.prev.id}">
      <input type="button" value="上一个" class="login btn btn-default btn-block">
    </a>
  </s:if>
  <s:else>
    <input type="button"  value="没有了" class="login btn btn-danger btn-block disabled">
  </s:else>
</div>
<div style="float: left ;margin:0px 0px 0px 500px;width:60px;">
  <s:if test="entity.next != null">
    <a href="${baseUrl}/${actionName}-view.action?id=${entity.next.id}">
      <input type="button"  value="下一个" class="login btn btn-default btn-block">
    </a>
  </s:if>
  <s:else>
    <input type="button"  value="没有了" class="login btn btn-danger btn-block disabled">
  </s:else>
</div>
