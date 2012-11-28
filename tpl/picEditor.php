<?php session_start(); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>环球探测 | 发布图片</title>
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.artDialog.js"></script>
    <script type="text/javascript" src="js/xheditor-1.1.14-zh-cn.min.js"></script>
    <script type="text/javascript" src="js/jquery.tagsinput.min.js"></script>
    <script type="text/javascript" src="js/jquery.filedrop.js"></script>
    <script type="text/javascript" src="js/picEditor.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/txtEditor.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.tagsinput.css">
</head>
<body>
<div id="header">
    <div id="headercontent">
        <img id="logopic" src="images/logo.png"/>

        <a id="index" href="index.php" class="blog">首页</a>
        <?php
        if (isset($_SESSION["nick"])) {
            echo '<div class="current">' . $_SESSION["bokeName"] . '</div>';
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
                <li class="hideli">博客设置</li>
            </ul>
        </div>
    </div>
</div>
<div id="container">
    <div id="title_wrapper">
        <h2 id="pb-main-title" class="clearfix">
            <span>发布图片</span>

            <div class="pb-share-tip" style="">
            </div>
        </h2>
        <div id="title">
            <label id="for_title">本地上传</label>
        </div>
        <div id="dropbox">
            <span class="message">拖拽图片至此处上传. <br/><i>(支持批量上传，每张图片请不要大于1M)</i></span>
        </div>

        <div id="neirong">
            <label id="for_neirong">或图片链接</label>
        </div>
    </div>
    <div id="main_wrapper">
        <input tabindex="1" type="text" name="pb-text-title" class="pb-input-text" id="pb-link"
               placeholder="在此输入链接">

        <div id="tag_div">
            <span id="tag_span">标签</span>

            <div id="tag_text_div">
                <input tabindex="1" type="text" name="pb-text-title" class="pb-input-text" id="tag_text">
            </div>
            <div id="clearboth"></div>
        </div>
        <div id="pb-action-holder" class="clearfix">
            <div class="pb-submit">
                <div cloud="" id="ctrlbuttonpb-submit" data-control="pb-submit" class="ui-button skin-button-willblue"
                     style="width: 70px; ">
                    <div id="submit_button">
                        <span id="submit_span">发布</span>
                    </div>
                </div>
            </div>
            <div class="pb-cancel">
                <div cloud="" id="ctrlbuttonpb-cancel" data-control="pb-cancel" class="ui-button skin-button-willlight"
                     style="width: 70px; "><span class="ui-button-bg-left skin-button-willlight-bg-left"></span>

                    <div id="ctrlbuttonpb-cancellabel" class="ui-button-label skin-button-willlight-label"><span
                            id="ctrlbuttonpb-canceltext" class="ui-button-text skin-button-willlight-text">取消</span>
                    </div>
                </div>
            </div>
            <span id="pb-submiting-tip" style="display:none;">正在保存...</span>
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
