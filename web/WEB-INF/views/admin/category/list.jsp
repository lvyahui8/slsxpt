<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--${action.registStyle("js/select2/select2-bootstrap.css")}--%>
<%--${action.registStyle("js/select2/select2.css")}--%>
${action.registStyle("js/selectboxit/jquery.selectBoxIt.css")}

${action.registScript("js/jquery.validate.min.js")}

${action.registScript("js/jquery.nestable.js")}
${action.registScript("js/selectboxit/jquery.selectBoxIt.min.js")}
${action.registScript("js/category.js")}
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../../layouts/admin/head.jsp" %>
<%@ include file="../../layouts/admin/header.jsp" %>

<div class="page-container">
    <%@ include file="../../layouts/admin/menu.jsp"%>

    <div class="main-content">
        <%@ include file="../../layouts/admin/top.jsp"%>
        <%-- 内容 --%>

        <div class="row">
            <div class="col-sm-6">

                <div class="panel panel-primary" data-collapsed="0">

                    <div class="panel-heading">

                        <div class="panel-title">
                            所有栏目
                        </div>

                        <div class="panel-options">
                            <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                            <a href="#" data-rel="reload"><i class="entypo-arrows-ccw"></i></a>
                        </div>
                    </div>

                    <div class="panel-body">

                        <div id="list-2" class="nested-list dd with-margins custom-drag-button"><!-- adding class "custom-drag-button" will create specific handler for dragging list items -->

                            <ul class="dd-list">
                                <s:iterator value="#session.topCategorys" var="topCategory">
                                    <li class="dd-item" data-id="${topCategory.id}">
                                        <div class="dd-handle">
                                            <span>.</span><span>.</span><span>.</span>
                                        </div>
                                        <div class="dd-content">
                                            <s:property value="#topCategory.name"/>
                                        </div>
                                        <s:if test="#topCategory.childrens.size() > 0">
                                            <ul class="dd-list">
                                                <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                                                    <li class="dd-item" data-id="${childCategoryl1.id}">
                                                        <div class="dd-handle">
                                                            <span>.</span><span>.</span><span>.</span>
                                                        </div>
                                                        <div class="dd-content">
                                                            <s:property value="#childCategoryl1.name"/>
                                                            <div class="pull-right">${childCategoryl1.cnType}</div>
                                                        </div>
                                                        <s:if test="#childCategoryl1.childrens.size() > 0">
                                                            <ul class="dd-list">
                                                                <s:iterator value="#childCategoryl1.childrens" var="childCategoryl2">
                                                                    <li class="dd-item" data-id="${childCategoryl2.id}">
                                                                        <div class="dd-handle">
                                                                            <span>.</span><span>.</span><span>.</span>
                                                                        </div>
                                                                        <div class="dd-content">
                                                                            <s:property value="#childCategoryl2.name"/>
                                                                        </div>
                                                                    </li>
                                                                </s:iterator>
                                                            </ul>
                                                        </s:if>
                                                    </li>
                                                </s:iterator>
                                            </ul>
                                        </s:if>
                                    </li>
                                </s:iterator>
                            </ul>
                        </div>
                        <form role="form" method="post" action="${baseUrl}/admin/category-postUpdateTree.action" id="updateTree-category-form">
                            <input type="text" hidden="hidden"  name="categorysJson"/>
                            <button type="submit" class="btn btn-blue btn-block">保存</button>
                        </form>

                    </div>

                </div>


            </div>
            <div class="col-sm-6">

                <div class="panel panel-primary" data-collapsed="0">

                    <div class="panel-heading">
                        <div class="panel-title">
                            新增栏目
                        </div>

                        <div class="panel-options">
                            <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        </div>
                    </div>

                    <div class="panel-body">
                        <form id="add-category-form" role="form" class="form-horizontal validate" action="${baseUrl}/admin/category-postSave.action" method="post">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">父栏目</label>
                                <div class="col-sm-5">
                                    <select name="parent_id" class="selectboxit">
                                        <option value="" >无父栏目</option>
                                        <s:iterator value="#session.topCategorys" var="topCategory">
                                            <option value="${topCategory.id}">${topCategory.name}</option>
                                            <s:if test="#topCategory.childrens.size() > 0">
                                                <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                                                    <option value="${childCategoryl1.id}">--${childCategoryl1.name}</option>
                                                </s:iterator>
                                            </s:if>
                                        </s:iterator>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">栏目名称</label>
                                <div class="col-sm-5">
                                    <input type="text" name="name" class="form-control" placeholder=""
                                           data-validate="required" data-message-required="名称必须填写" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">类型</label>
                                <div class="col-sm-5">
                                    <select name="type" class="selectboxit">
                                        <option value="normal">普通</option>
                                        <option value="exam">试题</option>
                                        <option value="article">文章</option>
                                        <option value="video">视频</option>
                                        <option value="audio">音频</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">问答模板</label>
                                <div class="col-sm-5" >
                                    <select name="qstTplId" class="selectboxit">
                                        <option value="">无</option>
                                        <s:iterator value="allTemplate" var="tpl">
                                            <option value="${tpl.id}">${tpl.name}</option>
                                        </s:iterator>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-5">
                                    <button type="submit" class="btn btn-blue btn-block">新增</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="panel panel-primary" data-collapsed="0">

                    <div class="panel-heading">
                        <div class="panel-title">
                            修改栏目
                        </div>

                        <div class="panel-options">
                            <a href="#" data-rel="collapse"><i class="entypo-down-open"></i></a>
                        </div>
                    </div>

                    <div class="panel-body">
                        <form id="update-category-form" method="post" role="form" class="form-horizontal validate" action="${baseUrl}/admin/category-postSave.action" data-delete="${baseUrl}/admin/category-postDelete.action">
                            <div class="form-group">
                                <label class="col-sm-3 control-label">栏目</label>
                                <div class="col-sm-5">
                                    <select name="id" class="selectboxit">
                                        <option value="">选择栏目</option>
                                        <s:iterator value="#session.topCategorys" var="topCategory">
                                            <option value="${topCategory.id}"
                                                    data-type="${topCategory.type}"
                                                    data-qstTplId="${topCategory.qstTplId}"
                                                    >${topCategory.name}</option>
                                            <s:if test="#topCategory.childrens.size() > 0">
                                                <s:iterator value="#topCategory.childrens" var="childCategoryl1">
                                                    <option value="${childCategoryl1.id}"
                                                            data-type="${childCategoryl1.type}"
                                                            data-qstTplId="${childCategoryl1.qstTplId}"
                                                            >--${childCategoryl1.name}</option>
                                                    <s:if test="#childCategoryl1.childrens.size() > 0">
                                                        <s:iterator value="#childCategoryl1.childrens" var="childCategoryl2">
                                                            <option value="${childCategoryl2.id}"
                                                                    data-type="${childCategoryl2.type}"
                                                                    data-qstTplId="${childCategoryl2.qstTplId}"
                                                                    >----${childCategoryl2.name}</option>
                                                        </s:iterator>
                                                    </s:if>
                                                </s:iterator>
                                            </s:if>
                                        </s:iterator>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">新名称</label>
                                <div class="col-sm-5">
                                    <input type="text" name="name" class="form-control" placeholder=""
                                           data-validate="required" data-message-required="名称必须填写">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">类型</label>
                                <div class="col-sm-5">
                                    <select name="type" class="selectboxit">
                                        <option value="normal">普通</option>
                                        <option value="exam">试题</option>
                                        <option value="article">文章</option>
                                        <option value="video">视频</option>
                                        <option value="audio">音频</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">问答模板</label>
                                <div class="col-sm-5" >
                                    <select name="qstTplId" id="qstTplId" class="selectboxit">
                                        <option value="">无</option>
                                        <s:iterator value="allTemplate" var="tpl">
                                            <option value="${tpl.id}">${tpl.name}</option>
                                        </s:iterator>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-5">
                                    <div class="col-sm-6">
                                        <button id="deleteBtn" type="button" class="btn btn-red btn-block">删除</button>
                                    </div>
                                    <div class="col-sm-6">
                                        <button type="submit" class="btn btn-blue btn-block">修改</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <%@ include file="../../layouts/admin/bottom.jsp"%>
    </div>
</div>

<%@ include file="../../layouts/admin/footer.jsp" %>
