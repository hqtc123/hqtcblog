/**
 * Created with JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-25
 * Time: 下午9:46
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
function isAtBottom() {
    return ((($(document).height() - $(window).height()) - $(window).scrollTop()) <= 50) ? true : false;
};


function showFeed(json) {
    $.each(json, function (index, html) {
        $(html).appendTo("#content");
    })
}
$(function () {
    //share part begin
    $("#hidetext").hide();
    $(".kwicks").kwicks({
        size:140,
        maxSize:200,
        spacing:10,
        behavior:"menu"
    });
    $("#text").mouseenter(function () {
        $("#hidetext").show();
    });
    $(".kwicks li:eq(0)").click(function () {
        setTimeout("javascript:location.href='../view/txtEditor.php'", 100);
    });
    $(".kwicks li:eq(1)").click(function () {
        setTimeout("javascript:location.href='../view/picEditor.php'", 100);
    });
    $(".kwicks li:eq(2)").click(function () {
        setTimeout("javascript:location.href='../view/linkEditor.php'", 100);
    });
    $(".kwicks li:eq(3)").click(function () {
        setTimeout("javascript:location.href='../view/videoEditor.php'", 100);
    });

    //视频播放
    $(".feed .videoDiv img").live("click", function () {
        $(this).next("embed").css("display", "block");
        $(this).next("embed").next(".stopVideo").css("display", "block");
        $(this).css("display", "none");
    })
    //收起视频
    $(".feed .videoDiv .stopVideo").live("click", function () {
        $(this).prev("embed").css("display", "none");
        $(this).prev("embed").prev("img").css("display", "block");
        $(this).css("display", "none");
    })

    var pageIndex = 0;
    var portraitUrl = $("#headpic img").attr("src");
    var email = $("#hide_email").html();
    var nick = $("#account").html();

    init(email, pageIndex);
//    var feedHead = createFeedHead(email, nick, portraitUrl, "2012-ffff");
//    var feedFoot = createFeedFoot(tagsArr, 0, 0);
//
//    var html = feedHead + createTxtDiv("shi ba", "ffffffddddddddddd") + feedFoot;
//    $(html).appendTo($("#content"));
//
//    var imgUrlArr = new Array("http://www.baidu.com/img/baidu_sylogo1.gif", "http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg",
//        "http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg");
//    html = feedHead + createPicDiv(imgUrlArr, "ffffffg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT2012113ddddddddddd") + feedFoot;
//    $(html).appendTo($("#content"));
//    html = feedHead + createVideoDiv("dddd video ddd", "http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg", "http://player.youku.com/player.php/sid/XMjAzOTk4NjI4/v.swf")
//        + feedFoot;
//    $(html).appendTo($("#content"));
//    html = feedHead + createLinkDiv("gugooooouu", "http://translate.google.cn/") + feedFoot;
//    $(html).appendTo($("#content"));
    function init(email) {

        $.ajax({
            url:getBaseUrl() + "/index.php?c=ShowController&a=initMyBlog",
            type:"POST",
            dataType:"json",
            data:{
                "email":email,
                "pageIndex":pageIndex
            },
            success:function (result) {
                pageIndex++;
                showFeed(result);
            }
        })
    }
    $(window).scroll(function () {
        if (isAtBottom()) {
//            init(email,pageIndex);
        }
    })
});