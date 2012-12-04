<?php session_start(); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>环球探测</title>
    <link rel="stylesheet" type="text/css" href="css/jquery.kwicks.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <script type="text/javascript" src="js/lib/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.kwicks.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.artDialog.js"></script>
    <script type="text/javascript" src="js/lib/jquery.tagsinput.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/txtEditor.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.tagsinput.css">
    <script type="text/javascript" src="js/header.js"></script>
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body>
<div id="header">
    <div id="headercontent">
        <img id="logopic" src="images/logo.png"/>

        <a id="index" href="index.php" class="current">首页</a>
        <?php
        if (isset($_SESSION["nick"])) {
            echo '<a href="myblog.php" class="blog">' . $_SESSION["bokeName"] . '</a>';
            echo '<div id="hide_email">' . $_SESSION["email"] . '</div>';
            echo '<div id="hide_nick">' . $_SESSION["nick"] . '</div>';
        } else {
            ?>
            <script language="javascript" type="text/javascript">
                setTimeout("javascript:location.href='login.php'", 5);
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
            <!--            <div id="loading">-->
            <!--                <img src="images/loading.gif" alt="">-->
            <!--                <span>载入更多……</span>-->
            <!--            </div>-->
            <div class="feed">
                <div class="blogIDHide">39</div>
                <div class="emailHide">1@1.com</div>
                <div class="headDiv"><img src="upload/portrait/portrait.png"></div>
                <div class="triangle"></div>
                <div class="feedDiv">
                    <div class="dateHolder">
                        <div class="author">1</div>
                        <div class="dateDiv">2012-12-03</div>
                    </div>
                    <div class="titleDiv">无题</div>
                    <div class="contentDiv">朝鲜半岛核危机</div>
                    <div class="seeHolder">
                        <div class="seeAll">查看原文→</div>
                    </div>
                    <div class="attrHolder">
                        <div class="tagsDiv"><span class="tagSpan">朝鲜</span></div>
                        <div class="optionsDiv">
                            <div class="optDiv removeDiv">删除</div>
                            <div class="optDiv reprintDiv">转载</div>
                            <div class="optDiv commentDiv">回应(0)</div>
                            <div class="optDiv likeDiv">★喜欢(0)</div>
                        </div>
                    </div>
                </div>
                <div class="feedComment">
                    <div class="cmtArea clearFix">
                        <textarea class="cmtText" rows="" cols=""></textarea>

                        <div class="cmtButton">
                            <span class="cmtSpan">回应</span>
                        </div>
                    </div>
                    <div class="cmtList">
                        <ul class="cmtUl">
                            <li class="cmtLi">
                                <div class="emailDiv">1@1.com</div>
                                <img class="cmtPor" width="32" height="32" src="upload/portrait/portrait.png">

                                <div class="cmtMain"><a class="cmtNick" href="#">1 </a><span
                                        class="cmtContent">d都顶顶顶顶顶顶顶顶顶水水水水水水水水水水d</span></div>
                            </li>
                        </ul>
                    </div>
                    <div class="shQi">
                        <span class="shQiSpan">收起↑</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="aside">
        <div id="search-wrapper">
            <div id="tag-search-box">
                <button id="tag-go-search" type="submit"></button>
                <input type="text" id="tag-search-input" placeholder="搜索标签">
            </div>
        </div>
        <div id="else">

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
