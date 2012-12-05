<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-12-5
 * Time: 上午10:21
 * To change this template use File | Settings | File Templates.
 */
session_start()?>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>环球探测</title>
    <link rel="stylesheet" type="text/css" href="css/jquery.kwicks.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/child.css"/>
    <script type="text/javascript" src="js/lib/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.kwicks.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.artDialog.js"></script>
    <script type="text/javascript" src="js/lib/jquery.tagsinput.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/txtEditor.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.tagsinput.css">
    <script type="text/javascript" src="js/header.js"></script>
    <script type="text/javascript" src="js/child.js"></script>
</head>
<body>
<div id="header">
    <div id="headercontent">
        <img id="logopic" src="images/logo.png"/>

        <a id="index" href="index.php" class="blog">首页</a>
        <?php
        if (isset($_SESSION["nick"])) {
            echo '<a class="blog" href="myblog.php">' . $_SESSION["bokeName"] . '</a>';
            echo '<div id="hide_email">' . $_SESSION["email"] . '</div>';
            echo '<div id="hide_nick">' . $_SESSION["nick"] . '</div>';
        } else {
            ?>
            <script language="javascript" type="text/javascript">
                setTimeout("javascript:location.href='login.php'", 500);
            </script>
            <?php
        }
        ?>
        <a id="child" href="child.php" class="current">子博</a>

        <div id="J_HeaderMiscAction" class="misc-action">
            <ul class="action-list">
                <li class="action-item"><a class="hideli" id="accountId" title="账户"></a></li>
                <li class="action-item"><a class="hideli" id="setId" title="设置"></a></li>
                <li class="action-item"><a class="hideli" id="logoutId" title="退出"></a></li>
            </ul>
        </div>
    </div>
</div>
<div id="container">
    <?php if (!isset($_SESSION["childName"])) {
    echo '<div class="noChild">
        <span>你还没有创建子博，点击创建→</span>
        <div id="makeDiv">
            <input type="text" id="makeText" placeholder="输入子博名称">
            <input id="makeButton" type="button" value="创建">
        </div>
    </div>';
}?>
    <div id="content">
        <div id="user">
            <div id="infoDiv">
                <div id="userPic">
                    <img src="upload/portrait/dog.jpg" alt="">
                </div>
                <div class="boDiv">
                    <span class="boSpan">万山红遍</span>
                    <span class="emHide">3@3.com</span>
                </div>
            </div>
        </div>
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
</body>
</html>