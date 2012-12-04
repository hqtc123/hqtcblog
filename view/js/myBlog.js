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
    $("#loading").remove();
    $.each(json, function (index, html) {
        $(html).appendTo("#content");
    });
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

    var finished = true;
    var pageIndex = 0;
    var email = $("#hide_email").html();
    var nick = $("#account").html();
    init(email);

    function init(email) {
        finished = false;
        $.ajax({
            url:getBaseUrl() + "/index.php?c=ShowController&a=initMyBlog",
            type:"POST",
            dataType:"json",
            data:{
                "email":email,
                "pageIndex":pageIndex
            },
            success:function (result) {
                if (result == "") {
                    $("#loading").remove();
                    var str = '<div id="noMore"><span>没有更多内容了</span></div>';
                    $(str).appendTo("#content");
                } else {
                    showFeed(result);
                    ++pageIndex;
                    finished = true;
                }
            }
        })
    }

    $(window).scroll(function () {
        var str = '<div id="loading"><img src="images/loading.gif" alt=""><span>载入更多……</span></div>';
        $("str").appendTo("#content");
        if (isAtBottom() && finished) {
            init(email);
        }
    })
    //删除博客
    $(".removeDiv").live("click", function () {
        var feed = $(this).parent().parent().parent().parent();
        var blogID = feed.children(".blogIDHide").html();
        var dia = $.dialog({
            title:"提示",
            lock:"true",
            content:"确定删除这篇博客？",
            ok:function () {
                $.ajax({
                    url:getBaseUrl() + "/index.php?c=BlogController&a=removeBlog",
                    type:"POST",
                    dataType:"json",
                    data:{
                        "blogID":blogID
                    },
                    success:function (result) {
                        if (result.success == 1) {
                            $.dialog({
                                lock:"true",
                                title:"提示",
                                content:result.msg,
                                time:1
                            })
                            feed.css("display", "none");
                        }
                    }
                })
            },
            cancel:function () {
                dia.close();
            }
        })
    })
    $(".feed .seeAll").live("click", function () {

    })
});