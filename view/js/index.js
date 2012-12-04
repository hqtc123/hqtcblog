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
Date.prototype.format = function (formatStr) {
    var str = formatStr;
    str = str.replace(/yyyy|YYYY/, this.getFullYear());
    str = str.replace(/MM|mm/, (this.getMonth() + 1) > 9 ? (this.getMonth() + 1).toString() : '0' + (this.getMonth() + 1));
    str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
    return str;
}
function goHisBlog(hisEmail) {
    $.ajax({
        url:getBaseUrl() + "/index.php?c=BokeController&a=toHisBo",
        type:"POST",
        dataType:"json",
        data:{
            "hisEmail":hisEmail
        },
        success:function (result) {
            if (result.success == 1) {
                setTimeout("javascript:location.href='../view/hisBlog.php'", 10);
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
    $("#account").mouseenter(function () {
        $(this).hide();
        $("#hidemenu").show();
    });
    $("#hidemenu").mouseleave(function () {
        $(this).hide();
        $("#account").show();
    });
//text  blog
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
//
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
//hide something
    var pageIndex = 0;
    var portraitUrl = $("#headpic img").attr("src");
    var email = $("#hide_email").html();
    var nick = $("#account").html();

    function refresh() {
        $(".removeDiv").each(function () {
            var feed = $(this).parent().parent().parent().parent();
            if (feed.children(".emailHide").html() != email) {
                $(this).hide();
            }
        })

    }


//    init(email);


    function init(email) {
        finished = false;
        $.ajax({
            url:getBaseUrl() + "/index.php?c=ShowController&a=initIndex",
            type:"POST",
            dataType:"json",
            data:{
                "email":email,
                "pageIndex":pageIndex
            },
            success:function (result) {
                showFeed(result);
                ++pageIndex;
                finished = true;
            }
        })
    }

//窗口滚动
//    $(window).scroll(function () {
//        var str = '<div id="loading"><img src="images/loading.gif" alt=""><span>载入更多……</span></div>';
//        $("str").appendTo("#content");
//        if (isAtBottom() && finished) {
//            init(email);
//        }
//    })

    //标签搜索
    $("#tag-go-search").live("click", function () {
        var tag = $("#tag-search-input").val();
        if (tag == "") {
            return false;
        }
        $("#content").empty();
        $.ajax({
            url:getBaseUrl() + "/index.php?c=ShowController&a=showTag",
            type:"POST",
            dataType:"json",
            data:{
                "tag":tag
            },
            success:function (result) {
                if (result != "") {
                    showFeed(result);
                    refresh();
                } else {
                    var str = '<div id="noMore"><span>没有找到相关内容</span></div>';
                    $(str).appendTo("#content");
                }
            }
        })
    })
    $(".feed .seeAll").live("click", function () {

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
    });
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
    })
    //访问他人界面
    $(".shQi").live("click", function () {
        var feed = $(this).parent().parent();
        feed.children(".feedComment").slideUp();
    })
    //添加评论
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
    //访问他人博客
    $(".author").live("click", function () {
        var feed = $(this).parent().parent().parent();
        var emailHide = feed.children(".emailHide");
        var hisEmail = emailHide.html();
        goHisBlog(hisEmail);
    })
    $(".cmtNick").live("click", function () {
        var cmtLi = $(this).parent().parent();
        var hisEmail = cmtLi.children(".emailDiv").html();
        goHisBlog(hisEmail);
    })
    //转载博客
    $(".reprintDiv").live("click", function () {
        var feed = $(this).parent().parent().parent().parent();
        var fromID = feed.children(".blogIDHide");
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
                    setTimeout("javascript:location.href='../view/hisBlog.php'", 10);
                }
            }
        })
    })
})