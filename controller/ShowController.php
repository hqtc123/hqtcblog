<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-30
 * Time: 下午4:47
 * To change this template use File | Settings | File Templates.
 */
require_once "VideoUrlParser.class.php";
class ShowController extends spController {
    function initMyBlog() {
        $blogClass = spClass("Blog");
        $userClass = spClass("User");
        $blogTagClass = spClass("BlogTag");
        $email = $this->spArgs("email");
        $pageIndex = $this->spArgs("pageIndex");
        $condition = array("email" => $email);
        $userResult = $userClass->find($condition);
        $nick = $userResult["nick"];
        $portraitUrl = $userResult["portraiturl"];
        $perCount = 5;
        $startIndex = $perCount * $pageIndex;
        $blogResult = $blogClass->findAll($condition, "blogid DESC", null, "$startIndex,$perCount");
        $returnArr = array();
        foreach ($blogResult as $blog) {
            $blogid = $blog["blogid"];
            $tagsArr = array();
            $blogTagResult = $blogTagClass->findAll(array("blogid" => $blogid));
            foreach ($blogTagResult as $blogTag) {
                $tagsArr[] = $blogTag["tagname"];
            }
            $type = $blog["type"];
            $date = $blog["date"];
            $commentNum = $blog["commentnum"];
            $likeNum = $blog["likenum"];
            $title = $blog["title"];
            $content = $blog["content"];
            $url = $blog["url"];
            $divHead = $this->createFeedHead($email, $nick, $portraitUrl, $date);
            $divFoot = $this->createFeedFoot($tagsArr, $commentNum, $likeNum);
            switch ($type) {
                case 1:
                    $html = $divHead . $this->createTxtDiv($title, $content) . $divFoot;
                    $returnArr[] = $html;
                    break;
                case 2:
                    $imgUrlArr = preg_split("/,/", $url);
                    $html = $divHead . $this->createPicDiv($imgUrlArr, $title) . $divFoot;
                    $returnArr[] = $html;
                    break;
                case 3:
                    $html = $divHead . $this->createLinkDiv($title, $url) . $divFoot;
                    $returnArr[] = $html;
                    break;
                case 4:
                    $videoArr = $this->getVideoInfo($url);
                    $imgUrl = $videoArr["imgUrl"];
                    $swfUrl = $videoArr["swf"];
                    $html = $divHead . $this->createVideoDiv($title, $imgUrl, $swfUrl) . $divFoot;
                    $returnArr[] = $html;
                    break;
            }
        }
        echo json_encode($returnArr);
    }

    function createFeedHead($email, $nick, $portraitUrl, $date) {
        $str = '<div class="feed"><div class="emailHide">' . $email .
            '</div><div class="headDiv"><img src=' . $portraitUrl .
            '></div><div class="triangle"></div>' .
            '<div class="feedDiv">' .
            '<div class="dateHolder">' .
            '<div class="author">' . $nick . '</div>' .
            '<div class="dateDiv">' . $date . '</div></div>';
        return $str;
    }

    function createFeedFoot($tagsArr, $commentnum, $likenum) {
        $str = '<div class="attrHolder"><div class="tagsDiv">';
        $tagsShow = 3;
        if (count($tagsArr) < $tagsShow) {
            $tagsShow = count($tagsArr);
        }
        for ($i = 0; $i < $tagsShow; $i++) {
            $str .= '<span class="tagSpan">' . $tagsArr[$i] . '</span>';
        }
        $str .= '</div><div class="optionsDiv"><div class="optDiv">' .
            '转载</div><div class="optDiv">回应(' . $commentnum . ')</div><div class="optDiv">★喜欢(' . $likenum . ')</div>' .
            '</div></div></div></div>';
        return $str;
    }

    function createTxtDiv($title, $content) {
        $str = '<div class="titleDiv">' . $title . '</div>' .
            '<div class="contentDiv">' . $content . '</div>';
        return $str;
    }

    function createPicDiv($imgUrlArr, $descr) {

        $str = '<div class="picDiv">';
//            <img src="http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg">
//                <img src="http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg">
//
        $picsShow = 2;
        if (count($imgUrlArr) < 2) {
            $picsShow = count($imgUrlArr);
        }
        for ($i = 0; $i < $picsShow; $i++) {
            $str .= '<img src=' . $imgUrlArr[$i] . '>';
        }
        $str .= '<div class="clear"></div><div class="descDiv">&nbsp;&nbsp;' . $descr . '</div></div>';
        return $str;
    }

    function createVideoDiv($title, $imgUrl, $videoUrl) {

        $str = '<div class="titleDiv">' . $title . '</div>' .
            '<div class="videoDiv"><img src="' . $imgUrl . '" alt="">' .
            '<embed src=' . $videoUrl . ' align="middle" allowScriptAccess="sameDomain "type="application/x-shockwave-flash"></embed>' .
            '<div class="stopVideo">收起↑</div><div class="clear"></div></div>';
        return $str;
    }

    function createLinkDiv($title, $url) {

        $str = '<div class="titleDiv">' . $title . '</div>' .
            '<div class="linkDiv"><a href="' . $url . '">' . $url . '</a></div>';
        return $str;
    }

    //抓取视频信息
    function getVideoInfo($url) {
        $info = VideoUrlParser::parse($url);
        $arr["title"] = $info["title"];
        $arr["imgUrl"] = $info["img"];
        $arr["swf"] = $info["swf"];
        return $arr;
    }
}
