/**
 * Created with JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-25
 * Time: 下午9:46
 * To change this template use File | Settings | File Templates.
 */
function createFeedHead(email, nick, portraitUrl, date) {
    var str = '<div class="feed"><div class="eamilHide">' + email +
        '</div><div class="headDiv"><img src=' + portraitUrl +
        '></div><div class="triangle"></div>' +
        '<div class="feedDiv">' +
        '<div class="dateHolder">' +
        '<div class="author">' + nick + '</div>' +
        '<div class="dateDiv">' + date + '</div></div>'
    return str;
}

function createFeedFoot(tagsArr, commentnum, likenum) {
    var str = '<div class="attrHolder"><div class="tagsDiv">';
    var tagsShow = 3;
    if (tagsArr.length < tagsShow) {
        tagsShow = tagsArr.length;
    }
    for (var i = 0; i < tagsShow; i++) {
        str += '<span class="tagSpan">' + tagsArr[i] + '</span>'
    }
    str += '</div><div class="optionsDiv"><div class="optDiv">' +
        '转载</div><div class="optDiv">回应(' + commentnum + ')</div><div class="optDiv">★喜欢(' + likenum + ')</div>' +
        '</div></div></div></div>';
    return str;
}
function createTxtDiv(title, content) {
    var str = '<div class="titleDiv">' + title + '</div>' +
        '<div class="contentDiv">' + content + '</div>'
    return str;
}
function createPicDiv(imgUrlArr, descr) {
    var str = '<div class="picDiv">';
//            <img src="http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg">
//                <img src="http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg">
//
    var picsShow = 2;
    if (imgUrlArr.length < 2) {
        picsShow = imgUrlArr.length;
    }
    for (var i = 0; i < picsShow; i++) {
        str += '<img src=' + imgUrlArr[i] + '>'
    }
    str += '<div class="clear"></div><div class="descDiv">&nbsp;&nbsp;' + descr + '</div></div>';
    return str;
}

function createVideoDiv(title, imgUrl, videoUrl) {
    var str = '<div class="titleDiv">' + title + '</div>' +
        '<div class="videoDiv"><img src="' + imgUrl + '" alt="">' +
        '<embed src=' + videoUrl + ' align="middle" allowScriptAccess="sameDomain "type="application/x-shockwave-flash"></embed>' +
        '<div class="stopVideo">收起↑</div><div class="clear"></div></div>';
    return str;
}
function createLinkDiv(title, url) {
    var str = '<div class="titleDiv">' + title + '</div>' +
        '<div class="linkDiv"><a href="' + url + '">' + url + '</a></div>';
    return str;
}

function init(email,pageIndex) {
    var feedArr;
    $.ajax({
        url:getBaseUrl() + "/index.php?c=ShowController&a=initMyBlog",
        type:"POST",
        dataType:"json",
        data:{
            "email":email,
            "pageIndex":pageIndex
        },
        success:function (result) {
            showFeed(result);
        }
    })
}

function showFeed(json){

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

    var tagsArr = new Array("fff", "dff", "dddddd", "dggg");
    var portraitUrl = $("#headpic img").attr("src");
    var email = $("#hide_email").html();
    var nick = $("#account").html();

    var feedHead = createFeedHead(email, nick, portraitUrl, "2012-ffff");
    var feedFoot = createFeedFoot(tagsArr, 0, 0);

    var html = feedHead + createTxtDiv("shi ba", "ffffffddddddddddd") + feedFoot;
    $(html).appendTo($("#content"));

    var imgUrlArr = new Array("http://www.baidu.com/img/baidu_sylogo1.gif", "http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg",
        "http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg");
    html = feedHead + createPicDiv(imgUrlArr, "ffffffg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT2012113ddddddddddd") + feedFoot;
    $(html).appendTo($("#content"));
    html = feedHead + createVideoDiv("dddd video ddd", "http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg", "http://player.youku.com/player.php/sid/XMjAzOTk4NjI4/v.swf")
        + feedFoot;
    $(html).appendTo($("#content"));
//    $(".feed .videoDiv embed").hide();
//    $(".feed .videoDiv .stopVideo").hide();
    html = feedHead + createLinkDiv("gugooooouu", "http://translate.google.cn/") + feedFoot;
    $(html).appendTo($("#content"));

});