<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-6-28
  Time: 下午8:41
  To change this template use File | Settings | File Templates.
--%>
<%--<%--%>
  <%--_this.registScript("js/neon-login.js");--%>
  <%--_this.registScript("js/");--%>
<%--%>--%>
${action.registScript("js/jquery.validate.min.js")}
${action.registScript("js/neon-login.js")}

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../layouts/admin/head.jsp"%>
<body  class="page-body login-page login-form-fall" data-url="">
<script type="text/javascript">
    var baseurl = '${baseUrl}',
            $ = $ || jQuery;
</script>
<div class="login-container">
  <div class="login-header login-caret">

    <div class="login-content">

      <a href="${baseUrl}/site-index.action" class="logo">
        <img src="assets/images/logo@2x.png" width="120" alt="" />
      </a>

      <p class="description">欢迎登录</p>

      <!-- progress bar indicator -->
      <div class="login-progressbar-indicator">
        <h3>43%</h3>
        <span>登录中...</span>
      </div>
    </div>

  </div>

  <div class="login-progressbar">
    <div></div>
  </div>

  <div class="login-form">

    <div class="login-content">

      <div class="form-login-error">
        <h3>非法登录</h3>
        <p> <strong>用户名</strong> 或 <strong>密码</strong> 错误</p>
      </div>

      <form method="post" role="form" id="form_login" action="${baseUrl}/site-postLogin.action">

        <div class="form-group">

          <div class="input-group">
            <div class="input-group-addon">
              <i class="entypo-user"></i>
            </div>
            <input type="text" class="form-control" name="username" id="username" placeholder="用户名" autocomplete="off" />
          </div>
        </div>

        <div class="form-group">

          <div class="input-group">
            <div class="input-group-addon">
              <i class="entypo-key"></i>
            </div>
            <input type="password" class="form-control" name="password" id="password" placeholder="密码" autocomplete="off" />
          </div>

        </div>

        <div class="form-group">
          <button type="submit" class="btn btn-primary btn-block btn-login">
            <i class="entypo-login"></i>
            登录
          </button>
        </div>
        <!--

        You can also use other social network buttons
        <div class="form-group">

            <button type="button" class="btn btn-default btn-lg btn-block btn-icon icon-left twitter-button">
                Login with Twitter
                <i class="entypo-twitter"></i>
            </button>

        </div>

        <div class="form-group">

            <button type="button" class="btn btn-default btn-lg btn-block btn-icon icon-left google-button">
                Login with Google+
                <i class="entypo-gplus"></i>
            </button>

        </div> -->

      </form>

      <div class="login-bottom-links">

        <a href="${baseUrl}/site-forget.action" class="link">忘记密码?</a>

        <br />

        <a href="#"></a> &nbsp;Author - <a href="#">lvyahui</a>

      </div>

    </div>

  </div>

</div>

<%@ include file="../layouts/admin/footer.jsp"%>

