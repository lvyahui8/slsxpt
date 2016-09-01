<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/21
  Time: 17:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<h4>
    所有评论
    <small class="text-muted">(2)</small>
</h4>
<hr/>
<!-- Comments List -->
<ul class="comments-list">

    <!-- Comment -->
    <li>
        <div class="comment">
            <div class="comment-thumb">
                <a href="#">
                    <img src="${assets}/fg/images/user-icon.png" class="img-circle" />
                </a>
            </div>
            <div class="comment-content">

                <div class="comment-author">
                    <a href="#">username</a>

                    <div class="comment-info">
                        <span class="time">5分钟前</span>
                        - <a href="#" class="secondary">回复</a>
                    </div>
                </div>

                <div class="comment-text">
                    还不错
                </div>

            </div>
        </div>
    </li>
    <li>
        <div class="comment">
            <div class="comment-thumb">
                <a href="#">
                    <img src="${assets}/fg/images/user-icon.png" class="img-circle" />
                </a>
            </div>
            <div class="comment-content">
                <div class="comment-author">
                    <a href="#">username</a>

                    <div class="comment-info">
                        <span class="time">5分钟前</span>
                        - <a href="#" class="secondary">回复</a>
                    </div>
                </div>
                <div class="comment-text">
                    还不错
                </div>
            </div>
        </div>

    </li>


    <form class="comment-form" method="post" action="" enctype="application/x-www-form-urlencoded">
        <h4>
            <a href="#" class="btn btn-primary pull-right">
                提交
            </a>
            评论
        </h4>
        <hr />
        <div class="form-group">
            <textarea class="form-control" name="message" placeholder="吐槽一下" rows="6"></textarea>
        </div>

    </form>
</ul>