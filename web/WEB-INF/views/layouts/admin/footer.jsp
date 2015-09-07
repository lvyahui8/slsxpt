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
