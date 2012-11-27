/**
 * Created with JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-11-27
 * Time: 下午2:48
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
function IsURL(str_url) {
    var strRegex = '^((https|http|ftp|rtsp|mms)?://)'
        + '?(([0-9a-z_!~*\'().&amp;=+$%-]+: )?[0-9a-z_!~*\'().&amp;=+$%-]+@)?' //ftp的user@
        + '(([0-9]{1,3}.){3}[0-9]{1,3}' // IP形式的URL- 199.194.52.184
        + '|' // 允许IP和DOMAIN（域名）
        + '([0-9a-z_!~*\'()-]+.)*' // 域名- www.
        + '([0-9a-z][0-9a-z-]{0,61})?[0-9a-z].' // 二级域名
        + '[a-z]{2,6})' // first level domain- .com or .museum
        + '(:[0-9]{1,4})?' // 端口- :80
        + '((/?)|' // a slash isn't required if there is no file name
        + '(/[0-9a-z_!~*\'().;?:@&amp;=+$,%#-]+)+/?)$';
    var re = new RegExp(strRegex);
    //re.test()
    if (re.test(str_url)) {
        return (true);
    } else {
        return (false);
    }
}
$(function () {
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
    $(".hideli:eq(2)").click(function () {
        setTimeout("javascript:location.href='../tpl/addBoke.php'", 100);
    })
    //share part end

    var title = "无题", link, date;

    $(".pb-submit").click(function () {
        if ($("#pb-text-title").val() != "") {
            title = $("#pb-text-title").val();
        }
        if ($("#pb-link").val() == "") {
            $.dialog({
                title:"错误",
                content:"请输入链接地址"
            })
            return false;
        }
        link = $("#pb-link").val();
        if (!IsURL(link)) {
            $.dialog({
                title:"错误",
                content:"无效的链接地址"
            })
            return false;
        }
        date = new Date().format("yyyy-mm-dd");
        tagStr = $("#tag_text").val();
        $.ajax({
            type:"POST",
            url:getBaseUrl() + "/index.php?c=BlogController&a=addBlog",
            dataType:"json",
            data:{
                "type":3,
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
                } else {
                    $.dialog({
                        title:"提示",
                        content:result.msg,
                        time:2
                    });
                }
            }
        });
    });

});