<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/15
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<s:if test="pageData.totalPage > 1">
    <div class="row">
        <div class="col-sm-3">
            <span class="mt15 mb15"> ${pageData.currentPage}/${pageData.totalPage},${pageData.totalItem}</span>
        </div>
        <div class="col-sm-9">
            <ul class="pagination pull-right">
                <s:if test="pageData.currentPage == 1">
                    <li class='disabled'>
                        <a href="#"><i class="entypo-left-open-mini"></i></a>
                    </li>
                </s:if>
                <s:else>
                    <li>
                        <a href="${pageData.listUrl}?currentPage=${pageData.currentPage-1}"><i
                                class="entypo-left-open-mini"></i></a>
                    </li>
                </s:else>
                <s:iterator begin="pageData.start" step="1" end="pageData.end" var="i">
                    <li ${pageData.currentPage == i ? "class='active'" : null}>
                        <a href="${pageData.listUrl}?currentPage=${i}">${i}</a>
                    </li>
                </s:iterator>
                <s:if test="pageData.currentPage == pageData.totalPage">
                    <li class='disabled'>
                        <a href="#"><i class="entypo-right-open-mini"></i></a>
                    </li>
                </s:if>
                <s:else>
                    <li>
                        <a href="${pageData.listUrl}?currentPage=${pageData.currentPage+1}"><i
                                class="entypo-right-open-mini"></i></a>
                    </li>
                </s:else>
            </ul>
        </div>
    </div>

</s:if>

