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
    <script type="text/javascript" src="js/lib/jquery.tagsinput.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/dialog-twitter.css">
    <link rel="stylesheet" type="text/css" href="css/txtEditor.css">
    <link rel="stylesheet" type="text/css" href="css/jquery.tagsinput.css">
    <script type="text/javascript" src="js/header.js"></script>
    <script type="text/javascript" src="js/editors/videoEditor.js"></script>
</head>
<body>
<?php include_once "header.php" ?>
<div id="container">
    <div id="title_wrapper">
        <h2 id="pb-main-title" class="clearfix">
            <span>发布视频</span>

            <div class="pb-share-tip" style="">
            </div>
        </h2>
        <div id="title">
            <label id="for_title">标题</label>
            <span class="tail">(如不填，默认为“无题”)</span>
        </div>
        <input tabindex="1" type="text" name="pb-text-title" class="pb-input-text" id="pb-text-title"
               placeholder="在此输入标题">

        <div id="neirong">
            <label id="for_neirong">视频链接</label>
        </div>
    </div>
    <div id="main_wrapper">
        <input tabindex="1" type="text" name="pb-text-title" class="pb-input-text" id="pb-video-link"
               placeholder="在此输入链接,支持优酷，土豆，酷六等主流网站">

        <div id="thumbDiv">
            <img id="thumbImg"
                 src="http://g3.ykimg.com/11270F1F4650B40F56816C0123193C35F34747-4CA0-9A47-8F4A-A6955B9604B4"
                 height="160" width="250"/>
            <input type="button" id="cancelVideo" value="取消">
        </div>
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
