/**
 * Created with JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-29
 * Time: 下午4:35
 * To change this template use File | Settings | File Templates.
 */
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

    var email = $("#hide_email").html();
    var nick = $("#account").html();

    $(".hideli:eq(0)").click(function () {
        $("#email_label").html(email);
        $("#nick_label").html(nick);
        var dialog = $.dialog({
            title:"账号信息",
            content:document.getElementById("dia_account")
        });
    })
    //log out
    $(".hideli:eq(1)").click(function () {
        $.ajax({
            type:"POST",
            dataType:"json",
            url:getBaseUrl() + "/index.php?c=UserController&a=logout",
            success:function (result) {
                if (result.success == 1) {
                    var dialog = $.dialog({
                        title:"提示",
                        content:result.msg,
                        time:2
                    });
                    setTimeout("javascript:location.href='../view/login.php'", 1000);
                }
            }
        })
    });
    $(".hideli:eq(2)").click(function () {
        setTimeout("javascript:location.href='../view/addBoke.php'", 100);
    })
//share part end
});