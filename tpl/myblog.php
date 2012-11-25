<?php session_start(); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><?php echo $_SESSION["bokeName"]; ?></title>
    <link rel="stylesheet" type="text/css" href="css/jquery.kwicks.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <script type="text/javascript" src="js/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/jquery.kwicks.min.js"></script>
    <script type="text/javascript" src="js/jquery.artDialog.js"></script>
    <script type="text/javascript" src="js/jquery.tipTip.minified.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/tipTip.css">
    <script type="text/javascript" src="js/index.js"></script>
    <link>
</head>
<body>
<div id="header">
    <div id="headercontent">
        <img id="logopic" src="images/logo.png"/>
        <a href="../index.php" id="index" class="blog">首页</a>
        <?php
        if (isset($_SESSION["nick"])) {
            echo '<div id="hide_email">' . $_SESSION["email"] . '</div>';
            echo '<div id="account">' . $_SESSION["nick"] . '</div>';
            if (isset($_SESSION["bokeName"])) {
                echo '<div class="current">' . $_SESSION["bokeName"] . '</div>';
            } else {
                echo '<div id="addblog" class="blog" title="添加一个新博客">+</div>';
            }
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
    <div id="mainarea">
        <div id="nav">
            <div id="headpic">
                <img src="images/portrait.png" alt="">
            </div>
            <div id="menubar">
                <ul class="kwicks">
                    <li id="text">
                        <img src="images/text.png" alt="文字">

                        <div id="hidetext" class="hidecls">文字</div>
                    </li>
                    <li id="pic">
                        <img src="images/pic.png" alt="图片">

                        <div id="hidepic" class="hidecls">图片</div>
                    </li>
                    <li id="music">
                        <img src="images/music.png" alt="音乐">

                        <div id="hidemusic" class="hidecls">音乐</div>
                    </li>
                    <li id="video">
                        <img src="images/video.png" alt="视频">

                        <div id="hidevideo" class="hidecls">视频</div>
                    </li>
                </ul>
            </div>
        </div>
        <div class="blank">

        </div>
        <div id="content">

            <div class="feed-list" id="feed-list">

            </div>
        </div>
    </div>
    <div id="aside">
        <div id="search-wrapper">
            <div id="tag-search-box">
                <button id="tag-go-search" type="submit"></button>
                <input type="text" id="tag-search-input" placeholder="发现自己的兴趣">
            </div>
        </div>
        <div id="else">

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
