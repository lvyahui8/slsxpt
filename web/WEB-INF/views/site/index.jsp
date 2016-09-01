<%--
  Created by IntelliJ IDEA.
  User: lvyahui
  Date: 15-6-18
  Time: 上午10:06
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<section class="features-blocks">

    <div class="container">

        <div class="row vspace"><!-- "vspace" class is added to distinct this row -->

            <div class="col-sm-4">

                <div class="feature-block">
                    <h3>
                        <i class="entypo-cog"></i>
                        标题一
                    </h3>

                    <p>
                        内容二
                    </p>
                </div>

            </div>

            <div class="col-sm-4">

                <div class="feature-block">
                    <h3>
                        <i class="entypo-gauge"></i>
                        标题二
                    </h3>

                    <p>
                        内容二
                    </p>
                </div>

            </div>

            <div class="col-sm-4">

                <div class="feature-block">
                    <h3>
                        <i class="entypo-lifebuoy"></i>
                        标题三
                    </h3>

                    <p>
                        内容三
                    </p>
                </div>

            </div>

        </div>

        <!-- Separator -->
        <div class="row">
            <div class="col-md-12">
                <hr />
            </div>
        </div>

    </div>
</section>


<!-- Portfolio -->
<section class="portfolio-widget">

    <div class="container">

        <div class="row">

            <div class="col-sm-3">

                <div class="portfolio-info">
                    <h3>
                        <a href="#">最近视频</a>
                    </h3>

                    <p>简介</p>
                </div>

            </div>

            <div class="col-sm-3">

                <!-- Portfolio Item in Widget -->
                <div class="portfolio-item">
                    <a href="#" class="image">
                        <img src="assets/images/portfolio-thumb-1.png" class="img-rounded" />
                        <span class="hover-zoom"></span>
                    </a>

                    <h4>
                        <a href="#" class="like">
                            <i class="entypo-heart"></i>
                        </a>

                        <a href="#" class="name">Neon</a>
                    </h4>

                    <div class="categories">
                        <a href="#">Web Design / Development</a>
                    </div>
                </div>

            </div>

            <div class="col-sm-3">

                <!-- Portfolio Item in Widget -->
                <div class="portfolio-item">
                    <a href="#" class="image">
                        <img src="assets/images/portfolio-thumb-1.png" class="img-rounded" />
                        <span class="hover-zoom"></span>
                    </a>

                    <h4>
                        <a href="#" class="like liked">
                            <i class="entypo-heart"></i>
                        </a>

                        <a href="#" class="name">Motorola</a>
                    </h4>

                    <div class="categories">
                        <a href="#">Photography</a>
                    </div>
                </div>

            </div>

            <div class="col-sm-3">

                <!-- Portfolio Item in Widget -->
                <div class="portfolio-item">
                    <a href="#" class="image">
                        <img src="assets/images/portfolio-thumb-1.png" class="img-rounded" />
                        <span class="hover-zoom"></span>
                    </a>

                    <h4>
                        <a href="#" class="like">
                            <i class="entypo-heart"></i>
                        </a>

                        <a href="#" class="name">Dribbble</a>
                    </h4>

                    <div class="categories">
                        <a href="#">UI Design</a>
                    </div>
                </div>

            </div>

        </div>
        <!-- Separator -->
        <div class="row">
            <div class="col-md-12">
                <hr />
            </div>
        </div>
    </div>

</section>

<!-- Members -->
<section class="content-section">

    <div class="container">

        <div class="row">

            <div class="col-sm-4">

                <div class="staff-member">

                    <a class="image" href="#">
                        <img src="assets/images/staff-member-1.jpg" class="img-circle" />
                    </a>

                    <h4>
                        <a href="#">路人甲</a>
                        <small>组长</small>
                    </h4>

                    <p>寄语</p>

                </div>

            </div>

            <div class="col-sm-4">

                <div class="staff-member">

                    <a class="image" href="#">
                        <img src="assets/images/staff-member-2.jpg" class="img-circle" />
                    </a>

                    <h4>
                        <a href="#">路人乙</a>
                        <small>成员</small>
                    </h4>

                    <p>寄语</p>

                </div>

            </div>

            <div class="col-sm-4">

                <div class="staff-member">

                    <a class="image" href="#">
                        <img src="assets/images/staff-member-3.jpg" class="img-circle" />
                    </a>

                    <h4>
                        <a href="#">路人丙</a>
                        <small>组员</small>
                    </h4>

                    <p>寄语</p>

                </div>

            </div>

        </div>

    </div>

</section>
<%@ include file="../layouts/footer.jsp" %>


