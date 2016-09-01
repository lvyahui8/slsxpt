<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!-- Footer Widgets -->
<section class="footer-widgets">

    <div class="container">

        <div class="row">

            <div class="col-sm-6">

                <a href="#">
                    <img src="${assets}/images/logo@2x.png" width="100" />
                </a>

                <p>
                    平台简介
                </p>

            </div>

            <div class="col-sm-3">

                <h5>组织</h5>

                <p>
                    中医药心理学平台团队
                </p>
            </div>

            <div class="col-sm-3">

                <h5>联系</h5>

                <p>
                    电话: 156666666 <br />
                    座机: 66666 <br />
                    邮箱: lvyahui8@126.com
                </p>

            </div>

        </div>

    </div>

</section>

<!-- Site Footer -->
<footer class="site-footer">

    <div class="container">

        <div class="row">

            <div class="col-sm-6">
                Copyright &copy; SLSXPT - All Rights Reserved.  <a href="${baseUrl}/admin">管理</a>
            </div>

            <div class="col-sm-6">

                <ul class="social-networks text-right">
                    <li>
                        <a href="#">
                            <i class="entypo-instagram"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="entypo-instagram"></i>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <i class="entypo-instagram"></i>
                        </a>
                    </li>
                </ul>

            </div>

        </div>

    </div>

</footer>
</div>
<!-- 当前视图特别的styles -->
${stylesHtml}
<%-- getStylesHmtl--%>
<!-- 公共js -->
<script src="${assets}/js/jquery-ui/js/jquery-ui-1.10.3.minimal.min.js"></script>
<script src="${applicationScope.assets}/fg/js/gsap/main-gsap.js"></script>
<script src="${applicationScope.assets}/fg/js/bootstrap.js"></script>
<script src="${applicationScope.assets}/fg/js/joinable.js"></script>
<script src="${applicationScope.assets}/fg/js/resizeable.js"></script>

<!-- 当前视图特别需要的 -->
${scriptsHtml}

<!-- JavaScripts initializations and stuff -->
<script src="${applicationScope.assets}/fg/js/neon-custom.js"></script>

</body>
</html>
