/**
 * Created with JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-12-5
 * Time: 上午10:25
 * To change this template use File | Settings | File Templates.
 */
function getBaseUrl() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0, pos);
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPaht + projectName);
}
$(function () {
    var email = $("#hide_email").html();
    $(".noChild span").live("click", function () {
        $("#makeDiv").css("display", "inline");
    })
    //log out
    $(".hideli:eq(2)").click(function () {
        $.ajax({
            type:"POST",
            dataType:"json",
            url:getBaseUrl() + "/index.php?c=UserController&a=logout",
            success:function (result) {
                if (result.success == 1) {
                    var dialog = $.dialog({
                        title:"提示",
                        content:result.msg,
                        time:2
                    });
                    setTimeout("javascript:location.href='../view/login.php'", 1000);
                }
            }
        })
    });
    $("#makeButton").live("click", function () {
        var name = $("#makeText").val();
        if (name == "") {
            return false;
        }
        $.ajax({
            url:getBaseUrl() + "/index.php?c=ChildController&a=addChild",
            type:"POST",
            dataType:"json",
            data:{
                "email":email,
                "name":name
            },
            success:function (result) {
                if (result.success == 1) {
                    $.dialog({
                        lock:"true",
                        title:"提示",
                        content:result.msg,
                        time:2
                    });
                    $(".noChild").hide();
                }
            }
        })
    });

    $.ajax({
        url:getBaseUrl() + "/index.php?c=ChildController&a=showChild",
        type:"POST",
        dataType:"json",
        success:function (result) {
            $.each(result, function (index, divStr) {
                $(divStr).appendTo("#content");
            });
        }
    })
})