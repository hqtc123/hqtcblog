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
function refresh() {
    $(".reprintDiv").each(function () {
        $(this).hide();
    })
}
function showFeed(json) {
    $("#loading").remove();
    $.each(json, function (index, html) {
        $(html).appendTo("#content");
    });
    refresh();
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
                    finished = false;
                } else {
                    showFeed(result);
                    ++pageIndex;
                    finished = true;
                }
            }
        })
    }

    $(window).scroll(function () {
        if (isAtBottom() && finished) {
            var str = '<div id="loading"><img src="images/loading.gif" alt=""><span>载入更多……</span></div>';
            $(str).appendTo("#content");
            init(email);
        }
    })
    //查看全文
    $(".feed .seeAll").live("click", function () {
        var feed = $(this).parent().parent().parent();
        var hisBlogID = feed.children(".blogIDHide").html();
        var hisEmail = feed.children(".emailHide").html();
        $.ajax({
            url:getBaseUrl() + "/index.php?c=ShowController&a=seeOne",
            type:"POST",
            dataType:"json",
            data:{
                "hisEmail":hisEmail,
                "hisBlogID":hisBlogID
            },
            success:function (result) {
                if (result.success == 1) {
                    setTimeout("javascript:location.href='../view/oneblog.php?id=" + hisBlogID + " '", 10);
                }
            }
        })
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
    //喜欢博客
    $(".likeDiv").live("click", function () {
        var like = $(this);
        var blogID = $(this).parent().parent().parent().parent().children(".blogIDHide").html();
        $.ajax({
            url:getBaseUrl() + "/index.php?c=CLPController&a=addLike",
            type:"POST",
            dataType:"json",
            data:{
                "email":email,
                "blogID":blogID
            },
            success:function (result) {
                if (result.success == 1) {
                    var num = result.num;
                    like.html("★喜欢(" + num + ")");
                } else {
                    $.dialog({
                        title:"提示",
                        lock:"true",
                        content:result.msg,
                        time:1
                    })
                }
            }
        })
    });
    //回应博客
    $(".commentDiv").live("click", function () {
        var feed = $(this).parent().parent().parent().parent();
        feed.children(".feedComment").slideDown();
    });

    $(".shQi").live("click", function () {
        var feed = $(this).parent().parent();
        feed.children(".feedComment").slideUp();
    })
    $(".cmtButton").live("click", function () {
        var feed = $(this).parent().parent().parent();
        var cmtUl = $(this).parent().next(".cmtList").children(".cmtUl");
        var commentDiv = feed.children(".feedDiv").children(".attrHolder").children(".optionsDiv").children(".commentDiv");
        if ($(this).prev(".cmtText").val() == "") {

        } else {
            var comment = $(this).prev(".cmtText").val();
            var blogID = feed.children(".blogIDHide").html();
            $.ajax({
                url:getBaseUrl() + "/index.php?c=CLPController&a=addComment",
                type:"POST",
                dataType:"json",
                data:{
                    "email":email,
                    "blogID":blogID,
                    "comment":comment
                },
                success:function (result) {
                    if (result.success == 1) {
                        var divStr = result.divStr;
                        $(divStr).prependTo(cmtUl);
                        commentDiv.html("回应(" + result.commentNum + ")");
                    } else {
                        alert("error");
                    }
                }
            })
        }
    })

    $(".feed .seeAll").live("click", function () {

    })
});