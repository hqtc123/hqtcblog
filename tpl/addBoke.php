<?php session_start(); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>环球探测 | 添加博客</title>
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.artDialog.js"></script>
    <script type="text/javascript" src="js/addblog.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/addboke.css"/>
</head>
<body>
<div id="header">
    <div id="headercontent">
        <img id="logopic" src="images/logo.png"/>

        <a id="index" href="index.php" class="blog">首页</a>
        <?php
        if (isset($_SESSION["nick"])) {
            echo '<div id="hide_email">' . $_SESSION["email"] . '</div>';
            echo '<div id="account">' . $_SESSION["nick"] . '</div>';
        } else {
            ?>
            <script language="javascript" type="text/javascript">
                setTimeout("javascript:location.href='login.html'", 500);
            </script>
            <?php
        }
        ?>
        <div id="hidemenu">
            <ul id="hideul">
                <li class="hideli">账号信息</li>
                <li class="hideli">退出登录</li>
            </ul>
        </div>
    </div>
</div>
<div id="container">
    <div id="content">
        <h2 class="tblog-tilte">
            <span class="title-icon"></span>
            创建一个博客
        </h2>

        <div id="tblog-container">
            <div id="tblog-error">

            </div>
            <form id="create-tblog-form" method="post">
                <input type="hidden" name="formKey" value="78a8fb7bc99a3c9cfff0a27012b1cb7f">

                <div class="tblog-create">
                    <div class="tblog-line clearfix">
                        <div class="tblog-left-column">
                            <label>博客名:</label>
                        </div>
                        <div class="tblog-right-column">
                            <div class="tblog-form-element">
                                <input type="text" class="ui-text skin-text-willwhite" cloud="" name="blogName" value=""
                                       placeholder="" id="ctrltextblogName" data-control="blogName"></div>
                            <div class="tblog-form-tip tblog-form-tip-name">例如:环球美食（不能长于8个字符）</div>
                        </div>
                    </div>
                </div>
                <div class="tblog-toolbar clearfix">
                    <a id="create-tblog-btn">
                        <div class="ui-button skin-button-willsilver" cloud="" id="ctrlbutton_innerui_0"
                             data-control="_innerui_0" style=""><span
                                class="ui-button-bg-left skin-button-willsilver-bg-left"></span>

                            <div id="ctrlbutton_innerui_0label" class="ui-button-label skin-button-willsilver-label">
                                <span id="ctrlbutton_innerui_0text" class="ui-button-text skin-button-willsilver-text">立即创建</span>
                            </div>
                        </div>
                    </a>
                    <a id="cancel-create-tblog" href="../index.php">
                        <div class="ui-button skin-button-willlight" cloud="" id="ctrlbutton_innerui_1"
                             data-control="_innerui_1" style=""><span
                                class="ui-button-bg-left skin-button-willlight-bg-left"></span>

                            <div id="ctrlbutton_innerui_1label" class="ui-button-label skin-button-willlight-label">
                                <span id="ctrlbutton_innerui_1text"
                                      class="ui-button-text skin-button-willlight-text">取消</span></div>
                        </div>
                    </a>
                </div>
            </form>
        </div>
    </div>
    <ul id="dia_account">
        <li class="dia_item">
            <label class="dia_label">邮箱：</label>
            <label id="email_label"></label>
        </li>
        <li class="dia_item">
            <label class="dia_label">昵称：</label>
            <label id="nick_label"></label>
        </li>
    </ul>
</div>
</body>
</html>
