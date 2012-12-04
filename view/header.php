<div id="header">
    <div id="headercontent">
        <img id="logopic" src="images/logo.png"/>

        <a id="index" href="index.php" class="blog">首页</a>
        <?php
        if (isset($_SESSION["nick"])) {
            echo '<div class="current">' . $_SESSION["bokeName"] . '</div>';
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