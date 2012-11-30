<?php session_start(); ?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
        "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>环球探测</title>
    <link rel="stylesheet" type="text/css" href="css/jquery.kwicks.min.css"/>
    <link rel="stylesheet" type="text/css" href="css/layout.css"/>
    <script type="text/javascript" src="js/lib/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.kwicks.min.js"></script>
    <script type="text/javascript" src="js/lib/jquery.artDialog.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/addboke.css">
    <script type="text/javascript" src="js/header.js"></script>
    <script type="text/javascript" src="js/addboke.js"></script>
</head>
<body>
<?php include_once "header.php" ?>
<div id="container">
    <div id="content">
        <h2 class="tblog-tilte">
            <span class="title-icon"></span>
            博客设置
        </h2>


        <div id="tblog-container">

            <div id="portrait">
                <div id="portraitLabel">
                    头像设置:
                </div>
                <img src=<?php if (isset($_SESSION["url"])) {
                    echo $_SESSION["url"];
                } else {
                    echo "upload/portrait/portrait.png";
                } ?> alt="">

                <div id="uploadDiv">
                    <!--                    <input id="uploadButton" type="file">-->
                    <input id="chooseButton" type="button" value="换头像">
                </div>
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
                                <input type="text" class="ui-text skin-text-willwhite" cloud="" name="blogName"
                                       value=<?php echo $_SESSION["bokeName"]; ?>
                                               id="ctrltextblogName" data-control="blogName">
                            </div>
                            <div class="tblog-form-tip tblog-form-tip-name">例如:环球美食（不能长于8个字符）</div>
                        </div>
                    </div>
                </div>
                <div class="tblog-toolbar clearfix">
                    <a id="create-tblog-btn">
                        <span>完成设置</span>
                    </a>
                </div>
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
<div id="portraits">
    <img id="default" src="upload/portrait/portrait.png" alt="" title="default"/>
    <img id="cat" src="upload/portrait/cat.jpg" alt="" title="cat"/>
    <img id="dog" src="upload/portrait/dog.jpg" alt="" title="dog"/>
    <img id="boy" src="upload/portrait/boy.jpg" alt="" title="boy"/>
    <img id="girl" src="upload/portrait/girl.jpg" alt="" title="girl"/>
</div>
</div>
</body>
</html>
