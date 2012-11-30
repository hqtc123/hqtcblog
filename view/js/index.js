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
        setTimeout("javascript:location.href='../view/txtEditor.php'",100);
    });
    $(".kwicks li:eq(1)").click(function () {
        setTimeout("javascript:location.href='../view/picEditor.php'",100);
    });
    $(".kwicks li:eq(2)").click(function () {
        setTimeout("javascript:location.href='../view/linkEditor.php'",100);
    });
    $(".kwicks li:eq(3)").click(function () {
        setTimeout("javascript:location.href='../view/videoEditor.php'",100);
    });
//

})