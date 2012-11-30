<?php session_start();
if (isset($_SESSION["email"])) header("Location:view/index.php");
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <script type="text/javascript" src="js/lib/jquery-1.8.1.min.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
    <link rel="stylesheet" type="text/css" href="css/login_register.css"/>
</head>

<body>
<div id="header">
    <div id="headercontent">
        <img src="images/logo.png"/>
        <img src="images/headcenter.png"/>

        <div id="regisbut">
            <a href="register.php">注 册</a>
        </div>
    </div>
</div>
<div id="container">
    <div id="aside">
        <img src="images/aside.png"/>
    </div>
    <div id="main-wrapper">
        <div id="mainarea">
            <h1>登 录</h1>
            <input type="text" class="textcls" placeholder="  请输入您的邮箱"/>
            <input type="password" class="textcls" placeholder="  请输入密码"/>
            <input type="button" class="lrbutcls" value="登 录"/>
        </div>
    </div>
</div>
</body>
</html>
