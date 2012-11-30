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
                setTimeout("javascript:location.href='login.php'", 500);
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