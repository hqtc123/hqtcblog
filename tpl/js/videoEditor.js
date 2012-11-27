/**
 * Created with JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-11-15
 * Time: 下午8:23
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
Date.prototype.format = function (formatStr) {
    var str = formatStr;
    str = str.replace(/yyyy|YYYY/, this.getFullYear());
    str = str.replace(/MM|mm/, (this.getMonth() + 1) > 9 ? (this.getMonth() + 1).toString() : '0' + (this.getMonth() + 1));
    str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
    return str;
}
$(function () {
    $("#thumbDiv").hide();
    $("#tag_text").tagsInput({width:"500px", height:"36px", defaultText:'按Enter确定', placeholderColor:"#888"});
    //share part begin
    $("#hidetext").hide();
    $("#text").mouseenter(function () {
        $("#hidetext").show();
    });
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
                    setTimeout("javascript:location.href='../tpl/login.php'", 1000);
                }
            }
        })
    });
    $(".hideli:eq(2)").click(function(){
        setTimeout("javascript:location.href='../tpl/addBoke.php'", 100);
    })
    //share part end

    var title, link, tagStr, date, img;
    $("#cancelVideo").click(function () {
        $("#thumbDiv").hide();
        $("#pb-video-link").show();
        $("#neirong").show();
    })
    $("#pb-video-link").blur(function () {
        link = $(this).val();
        if (link != "") {
            $.ajax({
                type:"POST",
                dataType:"json",
                url:getBaseUrl() + "/index.php?c=BlogController&a=getVideoInfo",
                data:{
                    "link":link
                },
                success:function (result) {
                    if (result.success == 1) {
                        img = result.imgUrl;
                        title = result.title;
                        $("#pb-video-link").hide();
                        $("#neirong").hide();
                        $("#thumbImg").attr("src", img);
                        $("#thumbDiv").show();
                        $("#pb-text-title").val(title);
                    } else {
                        $.dialog({
                            title:"出错啦",
                            content:result.msg,
                            time:1
                        });
                        link = false;
                    }
                }
            })
        }
    })
    $(".pb-submit").click(function () {

        title = "无题";
        link = $("#pb-video-link").val();
        if ($("#pb-text-title").val() != "") {
            title = $("#pb-text-title").val();
        }
        date = new Date().format("yyyy-mm-dd");
        tagStr = $("#tag_text").val();
        $.ajax({
            type:"POST",
            url:getBaseUrl() + "/index.php?c=BlogController&a=addBlog",
            dataType:"json",
            data:{
                "type":4,
                "tagStr":tagStr,
                "title":title,
                "link":link,
                "date":date,
                "commentNum":0,
                "likeNum":0,
                "email":email
            },
            success:function (result) {
                if (result.success == 1) {
                    $.dialog({
                        title:"提示",
                        content:result.msg,
                        time:2
                    });
                    setTimeout("javascript:location.href='../tpl/myblog.php'", 1000);
                }
            }
        });

    });
})