<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-6-29
  Time: 下午8:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <!-- 个人信息和通知 -->
    <div class="col-md-6 col-sm-8 clearfix">

        <ul class="user-info pull-left pull-none-xsm">

            <!-- 个人信息 -->
            <li class="profile-info dropdown">

                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <img src="${loginUser.avatar != null && loginUser.avatar != ""  ? loginUser.avatar : "http://dummyimage.com/44x44/a8a6a8/ffffff"}" alt="${loginUser.username}"
                         class="img-circle" width="44"/>
                    <s:if test="#session.loginUser != null">
                        <s:property value="#session.loginUser.username"/>
                    </s:if>
                </a>

                <ul class="dropdown-menu">
                    <!-- Reverse Caret -->
                    <li class="caret"></li>

                    <!-- Profile sub-links -->
                    <li>
                        <a href="extra-timeline.html">
                            <i class="entypo-user"></i>
                            个人资料
                        </a>
                    </li>

                    <li>
                        <a href="mailbox.html">
                            <i class="entypo-mail"></i>
                            邮件
                        </a>
                    </li>

                    <li>
                        <a href="extra-calendar.html">
                            <i class="entypo-calendar"></i>
                            日历
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            <i class="entypo-clipboard"></i>
                            任务
                        </a>
                    </li>
                </ul>
            </li>

        </ul>

    </div>


    <!-- Raw Links -->
    <div class="col-md-6 col-sm-4 clearfix hidden-xs">

        <ul class="list-inline links-list pull-right">
            <li>
                <a target="_blank" href="javascript:window.open('http://'+location.hostname,'_blank')">网站首页</a>
            </li>
            <li class="sep"></li>

            <li>

                <a href="${baseUrl}/site-logout.action">
                    退出 <i class="entypo-logout right"></i>
                </a>
            </li>
        </ul>

    </div>

</div>

<hr/>