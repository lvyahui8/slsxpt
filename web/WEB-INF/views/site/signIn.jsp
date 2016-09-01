<%--
  Created by IntelliJ IDEA.
  User: 熊孩子
  Date: 2015/11/22
  Time: 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<style type="text/css">
    <!--
    .shenglue {
        float: left;
        width: 300px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    -->
</style>
<section>
    <div class="container">
        <div class="row">
            <%--最新文章列表项--%>
            <%--${newArticals.title}--%>
            <div class="col-sm-8" id="" style="padding-top: 25px">
                <p>最新文章：</p>
                <s:iterator value="newArticles" id="newArtical">
                    <a title="${newArtical.title}" href="${baseUrl}/article-view.action?id=${newArtical.id}">
                        <div class="shenglue">
                                ${newArtical.title}
                        </div>
                        <div style="float: left;padding: 0px 0px 10px 60px">
                            发布时间：${newArtical.createdAt}
                        </div>
                    </a>
                </s:iterator>
            </div>
            <div class="col-sm-4">
                <form class="comment-form" id="signIn-form" method="post" action="${baseUrl}/site-postLogin.action"
                      enctype="" role="form">
                    <div id="error" class="" style="display:none; color: red">
                        <h3>用户名或密码错误</h3>
                    </div>
                    <br/>

                    <div class="form-group">
                        <label>用户名：</label>
                        <input type="text" name="username" class="form-control" name="name" placeholder=""/>
                    </div>

                    <div class="form-group">
                        <label>密码：</label>
                        <input type="password" name="password" class="form-control" name="name" placeholder=""/>
                    </div>

                    <div class="form-group">
                        <label></label>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-9"></div>
                            <div class="col-sm-3">
                                <label>
                                    <a href="${baseUrl}/site-forgetPassword.action">
                                        忘记密码
                                    </a>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <button type="submit" class="login btn btn-success btn-block ">
                                    登录
                                </button>
                            </div>
                            <div class="col-sm-6">
                                <button type="reset" class="btn btn-danger btn-block ">
                                    重置
                                </button>
                            </div>
                        </div>
                    </div>

                </form>
            </div>
        </div>
    </div>
    <br/>
</section>
<div classs='modal' id="forget-modal">
    <div class="modal-header"></div>
    <div class="modal-body"></div>
    <div class="modal-footer"></div>
</div>
<script>

    $(document).ready(function () {
        var $form = $('form#signIn-form');
//        $("#error").hide();
        $form.validate({
            rules: {
                username: {
                    required: true
                },
                password: {
                    required: true
                }
            },
            messages: {
                username: {
                    required: "用户名不能为空！"
                },
                password: {
                    required: "密码不能为空！"
                }
            },

            submitHandler: function (form) {
//                form.submit();
                $(form).ajaxSubmit({
                    success: function (resp) {
                        if (resp.success) {
                            window.location.href = resp.redirect_url;
                        } else {
//                            alert('帐号或密码错误');
                            $("#error").show();
                        }
                    },
                    error: function () {
                        alert('服务端异常');
                    }
                });
            }
        });
        // DOM 操作
        <%--$('button.login').click(function(){--%>
        <%--$.post('${baseUrl}/site-postLogin.action',{--%>
        <%--username : $('input[name="username"]').val(),--%>
        <%--password : $('input[name="password"]').val()--%>
        <%--},function(resp){--%>
        <%--if(resp.success){--%>
        <%--window.location.href = resp.redirect_url;--%>
        <%--}--%>
        <%--},'JSON');--%>
        <%--return false;--%>
        <%--});--%>
    });
    //    $.ajax({
    //        // 请求发送方式
    //        type : 'post',
    //        // 验证文件
    //        url : 'check.php',
    //        // 用户输入的帐号密码
    //        data : {'username': $("#username").val(),
    //               'password': $("#password").val()},
    //        // 异步，不写默认为True
    //        async: true,
    //        //请求成功后的回调
    //        success: function(data){
    //            if (data){
    //                alert('登录成功')
    //            }else{
    //                alert('帐号或密码错误');
    //            }
    //        },
    //        error: function(){
    //            alert('服务端异常');
    //        }
    //    });


    (function ($) {
        $(document).ready(function () {
            var $modal = $('#forget-modal');
            $('a#forget-btn').click(function () {
                $modal.modal('show');
            })
        });
    })($ || jQuery);

</script>
<%@ include file="../layouts/footer.jsp" %>
