<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/11/21
  Time: 23:19
  To change this template use File | Settings | File Templates.
--%>
${action.registStyle("js/selectboxit/jquery.selectBoxIt.css")}
${action.registScript("js/selectboxit/jquery.selectBoxIt.min.js")}
${action.registStyle("css/neon-forms.css")}

<!DOCTYPE html>
<html>
<head>
    <title>Bootstrap 实例 - 模态框（Modal）插件</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/jquery-1.00.0.min.js"></script>
    <script src="js/bootstrap.js"></script>
</head>

<body>

<h2>创建模态框（Modal）</h2>
<!-- 按钮触发模态框 -->
<button class="btn btn-primary btn-lg" data-toggle="modal"
        data-target="#myModal">
    开始演示模态框
</button>

<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title" id="myModalLabel">
                    模态框（Modal）标题
                </h4>
            </div>
            <div class="modal-body">
                在这里添加一些文本
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    关闭
                </button>
                <button type="button" class="btn btn-primary">
                    提交更改
                </button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../layouts/head.jsp" %>
<%@ include file="../layouts/header.jsp" %>
<section>
  <div class="container">
    <form role="form" class="comment-form" method="post" action="${baseUrl}/user-postInfo.action" enctype="#">
        <input type="hidden" name="id" value="${loginUser.id}"/>
      <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <div class="row">
                <div class="col-sm-6">
                    <div class="form-group">
                        <label>真实姓名</label>
                        <input type="text" class="form-control" name="name" value="${loginUser.name}" placeholder="" />
                    </div>
                    <div class="form-group" >
                        <label>学院</label>
                        <select class="form-control selectboxit" name="collegeId">
                            <s:iterator value="colleges" var="college">
                            <option value="${id}" ${id==loginUser.college.id ? "selected" : null}>${name}</option>
                            </s:iterator>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>班级</label>
                        <input name="clazz" type="text" value="${loginUser.clazz}" class="form-control" placeholder="" />
                    </div>

                </div>

                <div class="col-sm-6">

                    <div class="form-group">
                        <label>手机号码</label>
                        <input name="phone" type="text" value="${loginUser.phone}"  class="form-control" placeholder="" />
                    </div>
                    <div class="form-group">
                        <label>一句话评价</label>
                        <textarea name="label" class="form-control  wysihtml5" name="content" id="content"
                                data-stylesheet-url="${assets}/css/wysihtml5-color.css"
                                rows="5" >${loginUser.label}</textarea>
                    </div>

                    <div class="form-group">
                            <button type="submit" class="pull-right btn btn-blue ">保存</button>
                    </div>
                </div>
            </div>

        </div>
      </div>
    </form>
  </div>
  <br/>
</section>
<%@ include file="../layouts/footer.jsp" %>