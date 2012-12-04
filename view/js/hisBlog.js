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
})