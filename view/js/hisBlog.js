/**
 * Created with JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-12-4
 * Time: 上午10:54
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
function checkFollow(email, hisEmail) {
    $.ajax({
        url:getBaseUrl() + "/index.php?c=FollowController&a=check",
        type:"POST",
        dataType:"json",
        data:{
            "email":email,
            "hisEmail":hisEmail
        },
        success:function (result) {
            if (result.follow == 1) {
                $("#unBtn").show();
                $("#followBtn").hide();
            } else {
                $("#unBtn").hide();
                $("#followBtn").show();
            }
        }
    })
}
function toFollow(email, hisEmail) {
    $.ajax({
        url:getBaseUrl() + "/index.php?c=FollowController&a=addFollowUser",
        type:"POST",
        dataType:"json",
        data:{
            "email":email,
            "hisEmail":hisEmail
        },
        success:function (result) {
            if (result.success == 1) {
                $("#unBtn").show();
                $("#followBtn").hide();
            }
        }
    })
}
function unFollow(email, hisEmail) {
    $.ajax({
        url:getBaseUrl() + "/index.php?c=FollowController&a=removeFollowUser",
        type:"POST",
        dataType:"json",
        data:{
            "email":email,
            "hisEmail":hisEmail
        },
        success:function (result) {
            if (result.success == 1) {
                $("#unBtn").hide();
                $("#followBtn").show();
            }
        }
    })
}
function isAtBottom() {
    return ((($(document).height() - $(window).height()) - $(window).scrollTop()) <= 50) ? true : false;
};

function showFeed(json) {
    $("#loading").remove();
    $.each(json, function (index, html) {
        $(html).appendTo("#content");
    });
    refresh();
}
function refresh() {
    $(".removeDiv").each(function () {
        $(this).hide();
    })
}
$(function () {
    var hisEmail = $("#hisEmail").html();
    var email = $("#hide_email").html();
    var nick = $("#hide_nick").html();
    checkFollow(email, hisEmail);
    //关注与取消
    $("#unBtn").live("click", function () {
        unFollow(email, hisEmail);
    });
    $("#followBtn").live("click", function () {
        toFollow(email, hisEmail);
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
    init(hisEmail);

    function init(hisEmail) {
        finished = false;
        $.ajax({
            url:getBaseUrl() + "/index.php?c=ShowController&a=initMyBlog",
            type:"POST",
            dataType:"json",
            data:{
                "email":hisEmail,
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
        if (isAtBottom() && finished) {
            var str = '<div id="loading"><img src="images/loading.gif" alt=""><span>载入更多……</span></div>';
            $(str).appendTo("#content");
            init(hisEmail);
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
    $(".reprintDiv").live("click", function () {
        var feed = $(this).parent().parent().parent().parent();
        var fromID = feed.children(".blogIDHide").html();
        var date = new Date().format("yyyy-mm-dd");
        $.ajax({
            url:getBaseUrl() + "/index.php?c=CLPController&a=addReprint",
            type:"POST",
            dataType:"json",
            data:{
                "email":email,
                "fromID":fromID,
                "type":5,
                "date":date
            },
            success:function (result) {
                if (result.success == 1) {
                    $.dialog({
                        title:"提示",
                        lock:"true",
                        content:result.msg,
                        time:1
                    })
                }
            }
        })
    })
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
})