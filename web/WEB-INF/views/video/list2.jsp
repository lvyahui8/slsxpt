<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-7-7
  Time: 上午10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--${action.registStyle("js/jvectormap/jquery-jvectormap-1.2.2.css")}--%>
<%--${action.registStyle("js/rickshaw/rickshaw.min.css")}--%>

<%--${action.registScript("js/jvectormap/jquery-jvectormap-1.2.2.min.js")}--%>
<%--${action.registScript("js/jvectormap/jquery-jvectormap-europe-merc-en.js")}--%>
<%--${action.registScript("js/jquery.sparkline.min.js")}--%>
<%--${action.registScript("js/rickshaw/vendor/d3.v3.js")}--%>
<%--${action.registScript("js/rickshaw/rickshaw.min.js")}--%>
<%--${action.registScript("js/raphael-min.js")}--%>
<%--${action.registScript("js/morris.min.js")}--%>
${action.registScript("js/toastr.js")}

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Neon Admin Panel" />
  <meta name="author" content="" />

  <title>视频列表</title>

  <link rel="stylesheet" href="assets/js/jquery-ui/css/no-theme/jquery-ui-1.10.3.custom.min.css">
  <link rel="stylesheet" href="assets/css/font-icons/entypo/css/entypo.css">
  <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Noto+Sans:400,700,400italic">
  <link rel="stylesheet" href="assets/css/bootstrap.css">
  <link rel="stylesheet" href="assets/css/neon-core.css">
  <link rel="stylesheet" href="assets/css/neon-theme.css">
  <link rel="stylesheet" href="assets/css/neon-forms.css">
  <link rel="stylesheet" href="assets/css/custom.css">

  <script src="assets/js/jquery-1.11.0.min.js"></script>
  <script>$.noConflict();</script>

  <!--[if lt IE 9]><script src="assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body>
<div class="page-container">
  <%@ include file="../layouts/menu.jsp"%>

  <div class="main-content">
    <%@ include file="../layouts/top.jsp"%>
    <div>
        <!-- 头部 -->
        <div>
          <!--page title-->
          <div class=""><h1><center>心理咨询基本技能在线学习平台</center></h1></div>
          <!-- 进度条 -->
          <div>
            <div style="float:right"><a href="">个人中心</a></div>

            <div class="progress progress-striped active" style="float:right; width:90%">
              学习进度
              <div class="progress-bar progress-bar-success" style="width: 30%">
                <span class="sr-only">30% Complete (success)</span>
              </div>
              <div class="progress-bar progress-bar-warning" style="width: 20%">
                <span class="sr-only">15% Complete (warning)</span>
              </div>
              <div class="progress-bar progress-bar-danger" style="width: 40%">
                <span class="sr-only">40% Complete (danger)</span>
              </div>
            </div>
          </div>

        </div>

            <div class="row" id="portfolio-items" style="float: left">
              <div class="item col-sm-3 col-xs-6 filter-design" style="padding-left: 30px">
                <div class="portfolio-item" style="float: left">
                  <s:iterator value="pageData.getDatas()" var="video">
                    <div style="float: left">
                  <a href="#" class="image">
                    <img src="${video.thumbnail}" class="img-rounded img-responsive">
                    <span class="hover-zoom"></span>
                  </a>
                  <h4>
                    <a href="012-point-one.html" class="like">
                      <i class="entypo-heart"></i>
                    </a>
                    <a href="012-point-one.html" class="name">
                        ${video.title}
                    </a>
                  </h4>
                    </div>
                  </s:iterator>
                </div>
              </div>
            </div>

        <!--尾部-->
        <div class="row">

          <div class="col-md-12">

            <div class="text-center">

              <ul class="pagination">
                <li class="active">
                  <a href="">Last</a>
                </li>
                <li class="active">
                  <a href="012-point-one.html">1</a>
                </li>
                <li>
                  <a href="012-point-two.html">2</a>
                </li>
                <li>
                  <a href="012-point-there.html">3</a>
                </li>
                <li>
                  <a href="012-point-four.html">4</a>
                </li>
                <li>
                  <a href="012-point-five.html">5</a>
                </li>
                <li>
                  <a href="#">Next</a>
                </li>
              </ul>

            </div>

          </div>

        </div>
    </div>
  </div>

  <%@ include file="../layouts/bottom.jsp"%>

</div>
<%@ include file="../layouts/footer.jsp" %>
</body>
</html>