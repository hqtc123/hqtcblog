/**
 * Created with JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-11-5
 * Time: 下午4:08
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
    $("#account").mouseenter(function () {
        $(this).hide();
        $("#hidemenu").show();
    });
    $("#hidemenu").mouseleave(function () {
        $(this).hide();
        $("#account").show();
    });

    var email = $("#hide_email").html();
    var nick = $("#account").html();

    $(".hideli:eq(0)").click(function () {
        $("#email_label").html(email);
        $("#nick_label").html(nick);
        var dialog = $.dialog({
            title:"账号信息",
            content:document.getElementById("dia_account")
        });
    })
    //log out
    $(".hideli:eq(1)").click(function () {
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
                    setTimeout("javascript:location.href='../tpl/login.htmll'", 1000);
                }
            }
        })
    });
    $(".hideli:eq(2)").click(function () {
        setTimeout("javascript:location.href='../tpl/addBoke.php'", 100);
    })
    //share end
    var portraitDialog, portraitUrl = $("#portrait img").attr("src");
    $("#chooseButton").click(function () {
        portraitDialog = $.dialog({
            title:"选择一个头像",
            content:document.getElementById("portraits")
        })
    })
    $("#portraits img").click(function () {
        portraitDialog.close();
        switch ($(this).attr("id")) {
            case "cat":
                $("#portrait img").attr("src", "upload/portrait/cat.jpg");
                break;
            case "dog":
                $("#portrait img").attr("src", "upload/portrait/dog.jpg");
                break;
            case "boy":
                $("#portrait img").attr("src", "upload/portrait/boy.jpg");
                break;
            case "girl":
                $("#portrait img").attr("src", "upload/portrait/girl.jpg");
                break;
            default:
                $("#portrait img").attr("src", "upload/portrait/portrait.png");
                break;
        }
        portraitUrl = $("#portrait img").attr("src");
    })
//add boke
    $("#create-tblog-btn").click(function () {
        if ($("#ctrltextblogName").val() == "") {
            var dialog = $.dialog({
                title:"错误",
                content:"请输入您的博客名字",
                time:1
            })
            return false;
        }
        if ($("#ctrltextblogName").val().length > 8) {
            var dialog = $.dialog({
                title:"错误",
                content:"博客名字不能长于8个字符",
                time:1
            })
            return false;
        }

        $.ajax({
            type:"POST",
            dataType:"json",
            url:getBaseUrl() + "/index.php?c=BokeController&a=addBoke",
            data:{
                "email":email,
                "portraitUrl":portraitUrl,
                "bokeName":$("#ctrltextblogName").val()
            },
            success:(function (result) {
                if (result.success == 1) {
                    var dialog = $.dialog({
                        title:"提示",
                        content:result.msg,
                        time:2
                    })
                    setTimeout("javascript:location.href='../index.php',1000");
                } else {
                    var dialog = $.dialog({
                        title:"提示",
                        content:result.msg,
                        ok:function () {

                        }
                    })
                    return false;
                }
            })
        })
    })
})