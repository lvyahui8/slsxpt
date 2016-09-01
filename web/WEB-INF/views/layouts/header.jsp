<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<body class="page-body" data-url="">
<script type="text/javascript">
    var baseurl = '${baseUrl}',
            $ = $ || jQuery;
</script>
<div class="wrap">
    <div class="site-header-container container">
        <div class="row">

            <div class="col-md-12">

                <header class="site-header">

                    <section class="site-logo">

                        <a href="${baseUrl}/site-index.action">
                            <img src="${assets}/images/logo@2x.png" width="120" />
                        </a>
                    </section>

                    <nav class="site-nav">

                        <ul class="main-menu hidden-xs search-active" id="main-menu">
                            <li class="search">
                                <a href="#">
                                    <i class="entypo-search"></i>
                                </a>
                                <form method="get" class="search-form" action="" enctype="application/x-www-form-urlencoded">
                                    <input type="text" class="form-control" name="q" placeholder="搜索" />
                                </form>
                            </li>
                            <li >
                                <a href="${baseUrl}/site-index.action">
                                    <span>首页</span>
                                </a>
                            </li>
                            <s:iterator value="#session.topCategorys" var="topCategory">
                                <li>
                                    <a href="${topCategory.childrens.size() > 0  ? "#" : topCategory.url}">
                                        <span>${topCategory.name}</span>
                                    </a>
                                    <s:if test="#topCategory.childrens.size() > 0">
                                        <ul>
                                            <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                                                <li>
                                                    <a href="${childCategoryl1.childrens.size() > 0 ? "#" : childCategoryl1.url}">
                                                        <span>${childCategoryl1.name}</span>
                                                    </a>
                                                    <s:if test="#childCategoryl1.childrens.size() > 0">
                                                        <ul>
                                                            <s:iterator value="#childCategoryl1.childrens" var="childCategoryl2">
                                                                <li>
                                                                    <a href="${childCategoryl2.url}">
                                                                        <span>${childCategoryl2.name}</span>
                                                                    </a>
                                                                </li>
                                                            </s:iterator>
                                                        </ul>
                                                    </s:if>
                                                </li>
                                            </s:iterator>
                                        </ul>
                                    </s:if>
                                </li>
                            </s:iterator >
                            <li>
                                <s:if test="#session.loginUser!=null">
                                    <a href="${baseUrl}/user-profile.action">
                                        <span>个人中心</span>
                                    </a>
                                    <a href="${baseUrl}/site-logout.action">
                                        <span>退出</span>
                                    </a>
                                </s:if>
                                <s:else>
                                    <a href="${baseUrl}/site-signIn.action">
                                        <span>登录</span>
                                    </a>
                                    <a href="${baseUrl}/site-signUp.action">
                                        <span>注册</span>
                                    </a>
                                </s:else>
                            </li>
                        </ul>
                        <div class="visible-xs">
                            <a href="#" class="menu-trigger">
                                <i class="entypo-menu"></i>
                            </a>
                        </div>
                    </nav>

                </header>

            </div>

        </div>
    </div>