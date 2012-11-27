/**
 * Created with JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-25
 * Time: 下午9:46
 * To change this template use File | Settings | File Templates.
 */
function createTxtDiv(title, content, tagsArr, commentnum, likenum, date) {
    var str = '<div class="feed"><div class="headDiv"><img src="images/portrait.png" alt=""></div> <div class="triangle"></div>' +
        '<div class="feedDiv">' +
        '<div class="dateHolder">' +
        '<div class="dateDiv">' + date + '</div></div>' +
        '<div class="titleDiv">' + title + '</div>' +
        '<div class="contentDiv">' + content + ' </div><div class="attrHolder"><div class="tagsDiv">';
    for (var i = 0; i < tagsArr.length; i++) {
        str += '<span class="tagSpan">' + tagsArr[i] + '</span>'
    }
    str += '</div><div class="optionsDiv"><div class="optDiv">' +
        '转载</div><div class="optDiv">回应(' + commentnum + ')</div><div class="optDiv">★喜欢(' + likenum + ')</div>' +
        '</div></div></div></div>';
    return str;
}
$(function () {
    var tagsArr = new Array("fff", "dff");
    var html = createTxtDiv("shi ba", "ffffffddddddddddd", tagsArr, 4, 3, "999-99");
    $(html).prependTo($("#content"));
});