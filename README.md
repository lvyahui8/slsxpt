# slsxpt001
### database
![DB](https://raw.githubusercontent.com/lvyahui8/slsxpt001/master/db/DB.png)
###controller
BaseAction.java
###service
BaseService.java
###dao
BaseDao.java
###entry
BaseEntry.java
###views

--backgroud

``` java
${action.registStyle("js/rickshaw/rickshaw.min.css")}

${action.registScript("js/neon-chat.js")}

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>

<body class="page-body  page-fade" data-url="">
<div class="page-container">
  <%@ include file="../../layouts/admin/menu.jsp"%>

  <div class="main-content">
    <%@ include file="../../layouts/admin/top.jsp"%>

    <%@ include file="../../layouts/admin/bottom.jsp"%>
  </div>


</div>
</body>
<%@ include file="../../layouts/admin/footer.jsp" %>
```
--- background footer layouts
``` jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>

<!-- 当前视图特别的styles -->
${stylesHtml}
<%-- getStylesHmtl--%>
<!-- 公共js -->
<script src="${applicationScope.assets}/js/gsap/main-gsap.js"></script>
<script src="${applicationScope.assets}/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
<script src="${applicationScope.assets}/js/bootstrap.js"></script>
<script src="${applicationScope.assets}/js/joinable.js"></script>
<script src="${applicationScope.assets}/js/resizeable.js"></script>
<script src="${applicationScope.assets}/js/neon-api.js"></script>

<!-- 当前视图特别需要的 -->
${scriptsHtml}

<!-- JavaScripts initializations and stuff -->
<script src="${applicationScope.assets}/js/neon-custom.js"></script>


<!-- Demo Settings -->
<script src="${applicationScope.assets}/js/neon-demo.js"></script>
</body>
</html>
```
