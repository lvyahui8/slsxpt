<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-6-18
  Time: 上午10:06
  To change this template use File | Settings | File Templates.
--%>
<%--${requestScope._this.registStyle("js/jvectormap/jquery-jvectormap-1.2.2.css")}--%>
<%--${requestScope._this.registStyle("js/rickshaw/rickshaw.min.css")}--%>

<%--${requestScope._this.registScript("js/jvectormap/jquery-jvectormap-1.2.2.min.js")}--%>
<%--${requestScope._this.registScript("js/jvectormap/jquery-jvectormap-europe-merc-en.js")}--%>
<%--${requestScope._this.registScript("js/jquery.sparkline.min.js")}--%>
<%--${requestScope._this.registScript("js/rickshaw/vendor/d3.v3.js")}--%>
<%--${requestScope._this.registScript("js/rickshaw/rickshaw.min.js")}--%>
<%--${requestScope._this.registScript("js/raphael-min.js")}--%>
<%--${requestScope._this.registScript("js/morris.min.js")}--%>
${requestScope._this.registScript("js/toastr.js")}


<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>

<body class="page-body" data-url="">
<div class="page-container">
  <%@ include file="../../layouts/admin/menu.jsp"%>

  <div class="main-content">
    <%@ include file="../../layouts/admin/top.jsp"%>
    <script type="text/javascript">
      jQuery(document).ready(function ($) {
        // Sample Toastr Notification
        setTimeout(function () {
          var opts = {
            "closeButton": true,
            "debug": false,
            "positionClass": rtl() || public_vars.$pageContainer.hasClass('right-sidebar') ? "toast-top-left" : "toast-top-right",
            "toastClass": "black",
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
          };

          toastr.success("信息内容!", "信息标题", opts);
        }, 3000);

      });


      function getRandomInt(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
      }
    </script>


    <%@ include file="../../layouts/admin/bottom.jsp"%>
  </div>


</div>
</body>
<%@ include file="../../layouts/admin/footer.jsp" %>
