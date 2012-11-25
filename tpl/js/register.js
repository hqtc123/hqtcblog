/**
 * Created with JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-11-8
 * Time: 下午9:49
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
        var email = $(".textcls_re:eq(0)").val();
        var password = $(".textcls_re:eq(1)").val();
        var repassword = $(".textcls_re:eq(2)").val();
        var nick = $(".textcls_re:eq(3)").val();

        if (email == "") {
            $('<div id="msg" />').html("用户邮箱不能为空！").appendTo('#mainarea').fadeOut(2000);
            $(".textcls_re:eq(0)").focus();
            return false;
        }

        var regEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if (!regEmail.test(email)) {
            $('<div id="msg" />').html("用户邮箱格式不正确！").appendTo('#mainarea').fadeOut(2000);
            $(".textcls_re:eq(0)").focus();
            return false;
        }
        if (password == "") {
            $('<div id="msg" />').html("密码不能为空！").appendTo('#mainarea').fadeOut(2000);
            $(".textcls_re:eq(1)").focus();
            return false;
        }
        var regallnum = /^[0-9]{6,12}$/;
        var regPass = /^[\w]{6,12}$/;
        if (regallnum.test(password) || (!regPass.test(password))) {
            $('<div id="msg" />').html("密码须为6-12位数字字母组合").appendTo('#mainarea').fadeOut(2000);
            return false;
        }
        if (password != repassword) {
            $('<div id="msg" />').html("两次密码输入不一致").appendTo('#mainarea').fadeOut(2000);
            return false;
        }
        if (nick == "") {
            $('<div id="msg" />').html("昵称不能为空").appendTo('#mainarea').fadeOut(2000);
            return false;
        }
        if(nick.length>6){
            $('<div id="msg" />').html("昵称长度不能大于6个字符").appendTo('#mainarea').fadeOut(2000);
            return false;
        }
        $.ajax({
            url:getBaseUrl() + "/index.php?c=UserController&a=register",
            type:"POST",
            dataType:"json",
            data:{
                "email":email,
                "password":password,
                "nick":nick
            },
            success:function (result) {
                if (result.success == 1) {
                    var dialog = $.dialog({
                        title:"提示",
                        content:result.msg,
                        time:2
                    });
                    setTimeout("javascript:location.href='index.php'", 1000);
                } else {
                    $('<div id="msg" />').html("" + result.msg).appendTo('#mainarea').fadeOut(2000);
                    return false;
                }
            }
        });
    });
})
