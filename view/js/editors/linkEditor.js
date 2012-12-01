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
    var strRegex = /^http:\/\/[A-Za-z0-9]+\.[A-Za-z0-9]+[\/=\?%\-&_~`@[\]\':+!]*([^<>\"\"])*$/;
    var re = new RegExp(strRegex);
    //re.test()
    if (re.test(str_url)) {
        return (true);
    } else {
        return (false);
    }
}
$(function () {
    var email = $("#hide_email").html();
    var nick = $("#account").html();
    $("#tag_text").tagsInput({width:"500px", height:"36px", defaultText:'按Enter确定', placeholderColor:"#888"});

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
                $.dialog({
                    title:"提示",
                    content:result.msg,
                    time:2
                });
                if (result.success == 1) {
                    setTimeout("javascript:location.href='../view/myblog.php'", 1000);
                }
            }
        });
    });

});