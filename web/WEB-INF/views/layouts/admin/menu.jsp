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
                    <img src="${assets}/images/logo@2x.png" width="120"
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

        <ul id="main-menu" class="main-menu">
            <s:if test='#session.loginUser.type == "root"'>
                <li class='${actionName=="category" ?  "active opened" : "" }'>
                    <a href="${baseUrl}/admin/category-list.action">
                        <i class="entypo-list"></i>
                        <span class="title">栏目管理</span>
                    </a>

                </li>
            </s:if>
            <li class='${actionName=="exam" ?  "active opened" : "" }'>
                <a href="${baseUrl}/admin/exam-list.action">
                    <i class="entypo-book-open"></i>
                    <span class="title">试题资料管理</span>
                </a>
            </li>
            <li class='${actionName=="video" ?  "active opened" : "" }'>
                <a href="${baseUrl}/admin/video-list.action">
                    <i class="entypo-video"></i>
                    <span class="title">视频资料管理</span>
                </a>
            </li>
            <li class='${actionName=="audio" ?  "active opened" : "" }'>
                <a href="${baseUrl}/admin/audio-list.action">
                    <i class="entypo-music"></i>
                    <span class="title">音频资料管理</span>
                </a>
            </li>
            <li class='${actionName=="article" ?  "active opened" : "" }'>
                <a href="${baseUrl}/admin/article-list.action">
                    <i class="entypo-doc"></i>
                    <span class="title">文章资料管理</span>
                </a>
            </li>
            <li class='${actionName=="qstTpl" ?  "active opened" : "" }'>
                <a href="${baseUrl}/admin/qstTpl-list.action">
                    <i class="entypo-help-circled"></i>
                    <span class="title">问答模板管理</span>
                </a>
            </li>
            <s:if test='#session.loginUser.type == "root"'>
            <li class='${actionName=="user" ?  "active opened" : "" }'>
                <a href="${baseUrl}/admin/user-list.action">
                    <i class="entypo-user"></i>
                    <span class="title">用户管理</span>
                </a>
            </li>
            </s:if>
        </ul>
    </div>

</div>

