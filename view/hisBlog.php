<?php session_start();
if ($_SESSION["email"] == $_SESSION["hisEmail"]) {
    header("location:myblog.php");
}
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>访问博客</title>
    <link rel="stylesheet" type="text/css" href="css/jquery.kwicks.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/hisblog.css"/>
    <script type="text/javascript" src="js/lib/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.kwicks.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.artDialog.js"></script>
    <script type="text/javascript" src="js/lib/jquery.tagsinput.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/txtEditor.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.tagsinput.css">
    <script type="text/javascript" src="js/header.js"></script>
    <script type="text/javascript" src="js/hisBlog.js"></script>
</head>
<body>
<div id="header">
    <div id="headercontent">
        <img id="logopic" src="images/logo.png"/>

        <a id="index" href="index.php" class="blog">首页</a>
        <?php
        if (isset($_SESSION["nick"])) {
            echo '<div class="blog">' . $_SESSION["bokeName"] . '</div>';
            echo '<div class="current">' . $_SESSION["hisName"] . '</div>';
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
    <div id="mainarea">
        <div id="nav">
            <div id="infoDiv">
                <div id="hisEmail"><?php echo $_SESSION["hisEmail"]; ?></div>
                <div id="headpic">
                    <img src=<?php echo $_SESSION["hisUrl"]; ?> alt="">
                </div>
                <div class="nickDiv">
                    <span class="nickSpan"><?php echo $_SESSION["hisNick"]; ?></span>
                </div>
            </div>
            <div id="followBtn">
                <span id="followSpan">关注博客</span>
            </div>
            <div id="unBtn">
                <span id="unSpan">取消关注</span>
            </div>
        </div>
        <div class="blank">

        </div>
        <div id="content">
            <div id="loading">
                <img src="images/loading.gif" alt="">
                <span>载入更多……</span>
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
</div>
</body>
</html>
