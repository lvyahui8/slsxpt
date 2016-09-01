<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-6-29
  Time: 下午8:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="sidebar-menu">
    <div class="sidebar-menu-inner">
        <header class="logo-env">
            <div class="logo">
                <a href="${baseUrl}/admin/index.action">
                    <img src="http://dummyimage.com/241x56/a8a6a8/ffffff" width="120"
                         alt=""/>
                </a>
            </div>

            <!-- 普通PC按钮 -->
            <div class="sidebar-collapse">
                <a href="#" class="sidebar-collapse-icon with-animation">
                    <i class="entypo-menu"></i>
                </a>
            </div>


            <!-- open/close menu icon (为了在手机端使用不要删除) -->
            <div class="sidebar-mobile-menu visible-xs">
                <a href="#" class="with-animation"><!--增加 class "with-animation" 支持动画 -->
                    <i class="entypo-menu"></i>
                </a>
            </div>

        </header>
        <ul  class="main-menu" id="main-menu">
            <s:iterator value="#session.topCategorys" var="topCategory">
                <li class="">
                    <a href="${topCategory.url}"><span>${topCategory.name}</span></a>
                    <s:if test="#topCategory.childrens.size() > 0">
                        <ul >
                            <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                                <li >
                                    <a href="${childCategoryl1.url}"><span>${childCategoryl1.name}</span></a>
                                    <s:if test="#childCategoryl1.childrens.size() > 0">
                                        <ul>
                                            <s:iterator value="#childCategoryl1.childrens" var="childCategoryl2">
                                                <li >
                                                    <a href="${childCategoryl2.url}"><span>${childCategoryl2.name}</span></a>
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

    </div>
</div>

