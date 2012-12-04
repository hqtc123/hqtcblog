<?php session_start(); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns="http://www.w3.org/1999/html">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>环球探测</title>
    <link rel="stylesheet" type="text/css" href="css/jquery.kwicks.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/myblog.css"/>
    <script type="text/javascript" src="js/lib/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.kwicks.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.artDialog.js"></script>
    <script type="text/javascript" src="js/lib/jquery.tagsinput.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/txtEditor.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.tagsinput.css">
    <script type="text/javascript" src="js/header.js"></script>
    <script type="text/javascript" src="js/myBlog.js"></script>
</head>
<body>
<?php include_once "header.php" ?>
<div id="container">
    <div id="mainarea">
        <div id="nav">
            <div id="headpic">
                <img src=<?php echo $_SESSION["url"]; ?> alt="">
            </div>
            <div class="speTriangle">
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
                    <li id="link">
                        <img src="images/link.png" alt="链接">

                        <div id="hidemusic" class="hidecls">链接</div>
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
