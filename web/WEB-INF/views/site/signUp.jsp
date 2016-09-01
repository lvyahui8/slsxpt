<%--
  Created by IntelliJ IDEA.
  User: 熊孩子
  Date: 2015/11/22
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
${action.registScript("js/jquery.form.min.js")}
${action.registScript("js/jquery.validate.min.js")}

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>

<section>
    <div class="container">
        <div class="row">
            <form role="form" id="signUp-form" class="comment-form" method="post" action="${baseUrl}/site-postRegister.action" enctype="">
                <div class="col-sm-8"></div>
                <div class="col-sm-4">

                    <div class="form-group">
                        <label>用户名：</label>&nbsp;&nbsp;
                        <div id="usernameUsed" style="color: red; display:none; float: right">用户名已经存在</div>
                        <input type="text" name="username" class="form-control"/>
                    </div>

                    <div class="form-group">
                        <label>邮箱地址：</label>
                        <input type="text" name="email" class="form-control"/>
                    </div>

                    <div class="form-group">
                        <label>密码：</label>
                        <input type="password" id="password" name="password" class="form-control"/>
                    </div>

                    <div class="form-group">
                        <label>密码确认：</label>
                        <input type="password" name="rePassword" class="form-control"/>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-sm-6">
                                <button type="submit" class="btn btn-success btn-block ">
                                    注册
                                </button>
                            </div>
                            <div class="col-sm-6">
                                <button type="reset" class="btn btn-danger btn-block ">
                                    重置
                                </button>
                            </div>
                        </div>
                    </div>

                </div>


            </form>
        </div>
    </div>
    <br/>
    <br/>
</section>
<script>
    $(document).ready(function(){
        var $form = $('form#signUp-form'),
                $email = $form.find('input[name="email"]');
        $form.validate({
            rules   :   {
                username :  {
                    required :  true,
                    minlength  :   6,
                    maxlength   :   15
                },
                email   :   {
                    required :  true,
                    email   :   true,
                    remote : {
                        url         :   '${baseUrl}/site-checkEmail.action',
                        type        :   'POST',
                        dataType    :   'json',
                        data        :   {
                            email:function(){
                                return $email.val();
                            }
                        }
                    }
                },
                password :  {
                    required :  true,
                    minlength  :   3,
                    maxlength   :   15
                },
                rePassword :  {
                    required :  true,
                    equalTo:"#password"
                }
            },

            messages : {
                username : {
                    required : "用户名不能为空！",
                    maxlength: $.validator.format("用户名最多为 {0} 个字符"),
                    minlength: $.validator.format("用户名最少为 {0} 个字符"),
                },
                email : {
                    required : "E-Mail不能为空！",
                    email : "E-Mail不正确！"
                },
                password : {
                    required : "密码不能为空！",
                    maxlength: $.validator.format("密码最多为 {0} 位"),
                    minlength: $.validator.format("密码最少为 {0} 位"),
                },
                rePassword : {
                    required : "请确认密码！",
                    equalTo:"两次密码输入不一致!"
                }
            },
            submitHandler : function(form){
//                form.submit();
                $(form).ajaxSubmit({
                    success :   function(resp){
                        if(resp.success){
                            // 弹一个modal，提示用户，去邮箱激活
                           // alert("邮箱注册");
                            setTimeout(function(){
                                window.location.href = resp.redirect_url;
                            },2000);
                        }else{
                            $("#usernameUsed").show();
                        }
                    }
                });
            }
        });
    });
</script>
<%@ include file="../layouts/footer.jsp" %>