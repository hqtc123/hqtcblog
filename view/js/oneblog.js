/**
 * Created with JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-12-5
 * Time: 上午9:38
 * To change this template use File | Settings | File Templates.
 */
$(function () {
    var blogID = $("#hideHID").html();
    $.ajax({
        url:getBaseUrl() + "/index.php?c=ShowController&a=getOne",
        type:"POST",
        dataType:"json",
        data:{
            "blogID":blogID
        },
        success:function (result) {
            $(result.html).appendTo("#content");
        }
    })
});