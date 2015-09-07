
${requestScope._this.registStyle("js/selectboxit/jquery.selectBoxIt.css")}
${requestScope._this.registScript("js/selectboxit/jquery.selectBoxIt.min.js")}
${requestScope._this.registScript("js/fileinput.js")}
${requestScope._this.registScript("js/jquery.validate.min.js")}

<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>

<body class="page-body" data-url="">
<div class="page-container">
    <%@ include file="../../layouts/admin/menu.jsp"%>

    <div class="main-content">
        <%@ include file="../../layouts/admin/top.jsp"%>
        <ol class="breadcrumb bc-3" >
            <li>
                <a href="${baseUrl}/admin/index.action"><i class="fa-home"></i>Home</a>
            </li>
            <li>
                <a href="${baseUrl}/admin/user-list.action">所有用户</a>
            </li>
            <li class="active">
                <strong>添加用户</strong>
            </li>
        </ol>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <div class="panel-title">添加用户<small><code>ddd</code></small></div>

                <div class="panel-options">
                    <a href="#sample-modal" data-toggle="modal"
                       data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
                    <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                    <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                    <a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" id="user-item-form" method="post"
                      action="${baseUrl}/admin/user-postSave.action" class="form-horizontal validate">
                    <input type="text" name="id" value="${user.id}" hidden="hidden"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户名</label>
                        <div class="col-sm-5">
                            <input type="text" name="username" value="${user.username}" class="form-control" placeholder=""
                                   data-validate="required" data-message-required="名称必须填写">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">邮箱</label>
                        <div class="col-sm-5">
                            <input type="text" name="email" value="${user.email}" class="form-control" placeholder=""
                                   data-validate="required" data-message-required="邮箱必须填写">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">类型</label>
                        <div class="col-sm-5">
                            <select name="type" class="selectboxit">
                                <option value="customer" ${user.type == "customer" ? "selected" : ""} >会员</option>
                                <option value="admin" ${user.type == "admin" ? "selected" : ""}>管理员</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">头像</label>
                        <div class="col-sm-5">
                            <input type="text" name="avatar" value="${user.avatar}" hidden="hidden"/>
                            <div class="fileinput ${user.avatar == null ? "fileinput-new" : "fileinput-exists"}" data-provides="fileinput">
                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
                                    <img id="thumbnail" src="http://placehold.it/200x150" alt="...">
                                </div>
                                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px">
                                    <img src="${user.avatar}" alt="${user.username}"/>
                                </div>
                                <div>
                                    <span class="btn btn-white btn-file">
                                        <span class="fileinput-new">Select image</span>
                                        <span class="fileinput-exists">Change</span>
                                        <input type="file" name="thumbnailFile" accept="image/*" data-url="${baseUrl}/upload-save.action">
                                    </span>
                                    <a href="#" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label"></label>
                        <div class="col-sm-5">
                            <button type="submit" class="btn btn-blue btn-block">保存</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <%@ include file="../../layouts/admin/bottom.jsp"%>
    </div>
</div>
</body>
<%@ include file="../../layouts/admin/footer.jsp" %>
