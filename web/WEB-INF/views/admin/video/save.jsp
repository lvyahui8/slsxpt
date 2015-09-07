
${requestScope._this.registStyle("js/selectboxit/jquery.selectBoxIt.css")}
${requestScope._this.registStyle("js/wysihtml5/bootstrap-wysihtml5.css")}

${requestScope._this.registScript("js/selectboxit/jquery.selectBoxIt.min.js")}
${requestScope._this.registScript("js/wysihtml5/wysihtml5-0.4.0pre.min.js")}
${requestScope._this.registScript("js/wysihtml5/bootstrap-wysihtml5.js")}
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
                <a href="${baseUrl}/admin/exam-list.action">所有视频</a>
            </li>
            <li class="active">
                <strong>添加视频</strong>
            </li>
        </ol>
        <div class="panel panel-primary">

            <div class="panel-heading">
                <div class="panel-title">添加视频<small><code>ddd</code></small></div>

                <div class="panel-options">
                    <a href="#sample-modal" data-toggle="modal"
                       data-target="#sample-modal-dialog-1" class="bg"><i class="entypo-cog"></i></a>
                    <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                    <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                    <a href="#" data-rel="close"><i class="entypo-cancel"></i></a>
                </div>
            </div>

            <div class="panel-body">

                <form role="form" id="exam-item-form" method="post"
                      action="${baseUrl}/admin/video-postSave.action" class="form-horizontal validate">
                    <input type="text" name="id" value="${project.id}" hidden="hidden"/>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">栏目</label>
                        <div class="col-sm-5">
                            <select name="category_id" class="selectboxit">
                                <s:iterator value="#session.topCategorys" var="topCategory">
                                    <s:if test='#topCategory.type == "video"'>
                                        <option value="${topCategory.id}"
                                            ${topCategory.id == project.category.id ? "selected" : ""}>${topCategory.name}</option>
                                    </s:if>
                                    <s:if test="#topCategory.childrens.size() > 0">
                                        <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                                            <s:if test='#childCategoryl1.type == "video"'>
                                                <option value="${childCategoryl1.id}"
                                                    ${childCategoryl1.id == project.category.id ? "selected" : ""}>--${childCategoryl1.name}</option>
                                            </s:if>
                                            <s:if test="#childCategoryl1.childrens.size() > 0">
                                                <s:iterator value="#childCategoryl1.childrens" var="childCategoryl2">
                                                    <s:if test='#childCategoryl2.type == "video"'>
                                                        <option value="${childCategoryl2.id}"
                                                            ${childCategoryl2.id == project.category.id ? "selected" : ""}>----${childCategoryl2.name}</option>
                                                    </s:if>
                                                </s:iterator>
                                            </s:if>
                                        </s:iterator>
                                    </s:if>
                                </s:iterator>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">标题</label>
                        <div class="col-sm-5">
                            <input type="text" name="title" value="${project.title}" class="form-control" placeholder=""
                                   data-validate="required" data-message-required="名称必须填写">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">说明</label>
                        <div class="col-sm-5">
              <textarea class="form-control wysihtml5" data-stylesheet-url="${baseUrl}/assets/css/wysihtml5-color.css"
                        name="content" id="content">${project.content}</textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">视频文件</label>
                        <div class="col-sm-5">
                            <input type="text" name="resourceUrl" value="${project.resourceUrl}" id="resourceUrl" hidden="hidden"/>
                            <div class="progress" style='display: none;'>
                                <div class="progress-bar progress-bar-success uploadVideoProgress" role="progressbar"
                                     aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%">

                                </div>
                            </div>
                            <input type="file" class="form-control file2 inline btn btn-primary uploadInput uploadVideo"
                                   accept="video/mp4"
                                   data-url="${baseUrl}/upload-video.action"
                                   data-label="<i class='glyphicon glyphicon-circle-arrow-up'></i> &nbsp;选择文件" />
                            <script>
                                (function($){
                                    $(document).ready(function(){
                                        var $progress   = $('.uploadVideoProgress'),
                                                start  = false;
                                        $('input.uploadInput.uploadVideo').uploadFile({
                                            beforeSend      : function(){
                                                $progress.parent().show();
                                            },
                                            uploadProgress  : function(event, position, total, percent){
                                                $progress.attr('aria-valuenow',percent);
                                                $progress.width(percent+'%');
                                                if(percent >= 100){
                                                    $progress.parent().hide();
                                                    $progress.attr('aria-valuenow',0);
                                                    $progress.width(0+'%');
                                                }
                                            },
                                            success         : function(data){
                                                if(data.success){
                                                    $('input[name="resourceUrl"]').val(data.link);
                                                    setTimeout(function(){
                                                        var $img = $('<img>').attr('src', data.thumbnail);
                                                        $('.fileinput-preview').html($img);
                                                        $('.fileinput').addClass('fileinput-exists').removeClass('fileinput-new');
                                                        $('input[name="thumbnail"]').val(data.thumbnail);
                                                    },800);
                                                    $('#refershThumbnail').click(function(){
                                                        $(this).attr('src',data.link);
                                                    });
                                                }
                                            }
                                        });
                                    });
                                })(jQuery);
                            </script>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label">缩量图</label>
                        <div class="col-sm-5">
                            <input type="text" name="thumbnail" value="${project.thumbnail}" hidden="hidden"/>
                            <div class="fileinput ${project.thumbnail == null ? "fileinput-new" : "fileinput-exists"}" data-provides="fileinput">
                                <div class="fileinput-new thumbnail" style="width: 200px; height: 150px;" data-trigger="fileinput">
                                    <img id="thumbnail" src="http://placehold.it/200x150" alt="...">
                                </div>
                                <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px">
                                    <img src="${project.thumbnail}" alt="${project.title}"/>
                                </div>
                                <div>
                                    <span class="btn btn-white btn-file">
                                        <span class="fileinput-new">Select image</span>
                                        <span class="fileinput-exists">Change</span>
                                        <input type="file" name="thumbnailFile" accept="image/*" data-url="${baseUrl}/upload-save.action">
                                    </span>
                                    <a href="javascript:void(0)" class="btn btn-orange fileinput-exists" data-dismiss="fileinput">Remove</a>
                                </div>
                            </div>
                            <a href="#" id="refershThumbnail">重新获取</a>
                        </div>
                        <script>
                            (function($){
                                $(document).ready(function(){
                                });
                            })(jQuery);
                        </script>
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
