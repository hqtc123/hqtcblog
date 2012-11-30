/**
 * Created with JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-11-12
 * Time: 下午7:13
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
    $(".lrbutcls").click(function () {
        var email = $(".textcls:eq(0)").val();
        var password = $(".textcls:eq(1)").val();
        if (email == "") {
            $('<div id="msg" />').html("用户邮箱不能为空！").appendTo('#mainarea').fadeOut(2000);
            $(".textcls:eq(0)").focus();
            return false;
        }
        if (password == "") {
            $('<div id="msg" />').html("密码不能为空！").appendTo('#mainarea').fadeOut(2000);
            $(".textcls:eq(1)").focus();
            return false;
        }
        $.ajax({
            type:"POST",
            dataType:"json",
            url:getBaseUrl() + "/index.php?c=UserController&a=login",
            data:{
                "email":email,
                "password":password
            },
            success:function (result) {
                if(result.success==1){
                    setTimeout("javascript:location.href='index.php'",1000);
                }else{
                    $('<div id="msg" />').html(result.msg).appendTo('#mainarea').fadeOut(2000);
                    return false;
                }
            }
        })
    });
});