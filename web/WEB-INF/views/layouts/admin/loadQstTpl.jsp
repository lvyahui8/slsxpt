<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/10/11
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    jQuery(document).ready(function(){
        var loadQstTpl = function (qstTplId) {
            if(!qstTplId) return;
            var itemHtml = function(index,item){
                return "<div class='form-group'>" +
                        '<input class="form-control" name="questions['+index+'].title" placeholder="问题'+index+'" value="'+item.title+'">' +
                        '<input class="form-control" name="questions['+index+'].answer" placeholder="答案'+index+'" value="'+item.answer+'">' +
                        "</div>";
            };
            $.get("${baseUrl}/admin/category-template.action?qstTplId="+qstTplId,function(resp){
                var html = '';
                if(resp.success){
                    html = resp.items.map(function(item,index){
                        return itemHtml(index,item);
                    }).join('');
                }
                $('#question-container').html(html);
            });
        };
        loadQstTpl($('form select[name="categoryId"] option:first').data('qsttplid'));
        $('form select[name="categoryId"]').change(function(ev){
            var $this = $(this),
                    $selected = $this.find('option:selected');
            loadQstTpl($selected.data('qsttplid'));
        });
    });
</script>