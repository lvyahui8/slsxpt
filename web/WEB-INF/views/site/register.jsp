<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-6-26
  Time: 下午3:46
  To change this template use File | Settings | File Templates.
--%>

${action.registScript("js/jquery.validate.min.js")}
${action.registScript("js/neon-register.js")}
${action.registScript("js/jquery.inputmask.bundle.min.js")}

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
        <img src="http://dummyimage.com/241x56/a8a6a8/ffffff&text=LOGO" width="120" alt="" />
      </a>

      <p class="description">创建一个免费账户</p>

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

      <form method="post" role="form" id="form_register" action="postRegister.action">

        <div class="form-register-success">
          <i class="entypo-check"></i>
          <h3>你注册成功了</h3>
          <p>我们将发送一封激活到您邮箱，请查收</p>
        </div>
        <s:fielderror/>
        <div class="form-steps">

          <div class="step" id="step-1">

          </div>

          <div class="step current" id="step-2">

            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="entypo-user-add"></i>
                </div>
                <input type="text" class="form-control" name="username" id="username" placeholder="用户名，字母和数字" data-mask="[\w]+" data-is-regex="true" autocomplete="off" />
              </div>
            </div>

            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="entypo-mail"></i>
                </div>

                <input type="text" class="form-control" name="email" id="email" data-mask="email" placeholder="邮箱" data-url="${baseUrl}/site-checkEmail.action" autocomplete="off" />
              </div>
            </div>

            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="entypo-lock"></i>
                </div>

                <input type="password" class="form-control" name="password" id="password" placeholder="密码" autocomplete="off" />
              </div>
            </div>
            <div class="form-group">
              <div class="input-group">
                <div class="input-group-addon">
                  <i class="entypo-lock"></i>
                </div>

                <input type="password" class="form-control" name="rePassword" id="rePassword" placeholder="确认密码" autocomplete="off" />
              </div>
            </div>
            <div class="form-group">
              <button type="submit" class="btn btn-success btn-block btn-login">
                <i class="entypo-right-open-mini"></i>
                注册
              </button>
            </div>
          </div>

        </div>

      </form>


      <div class="login-bottom-links">

        <a href="${baseUrl}/site-login.action" class="link">
          <i class="entypo-lock"></i>
          登录
        </a>

        <br />

        <a href="#">Author</a>  - <a href="#">lvyahui</a>

      </div>

    </div>

  </div>

</div>
<%@ include file="../layouts/admin/footer.jsp"%>