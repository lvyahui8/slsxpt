/**
 * Created by lvyahui on 15-6-30.
 */

(function($, window, undefined){
    "use strict";

    jQuery(document).ready(function($)
    {

        var $categorysTree = $('.dd'),
            $updateTree_from = $('#updateTree-category-form'),
            $updateForm = $('#update-category-form');
        $categorysTree.nestable({
            maxDepth : 3
        }).on('change',function(){
            var data = $categorysTree.nestable('serialize');
            $updateTree_from.get(0)
                .categorysJson.value = JSON.stringify($categorysTree.nestable('serialize'));
        });

        $updateForm.find('#deleteBtn').click(function(){
            $updateForm.attr('action',$updateForm.data('delete'));
            $updateForm.submit();
        });

        $updateForm.find('select[name=id]').change(function(ev){

            //var selected = $(this).get(0).selectedOptions[0];
            var $this = $(this),
                $selected = $this.find('option:selected'),
                $typeSelector = $updateForm.find('select[name="type"]'),
                type = $selected.get(0).dataset.type;
            $updateForm.find('input[name="name"]')
                .val($selected.text().substr($selected.text().lastIndexOf("-")+1));
            $typeSelector.find('option[value="'+type+'"]').attr("selected",true).trigger('change');
        });

    });
})(jQuery,window);
