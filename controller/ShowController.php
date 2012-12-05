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

        $email = $this->spArgs("email");
        $pageIndex = $this->spArgs("pageIndex");
        $condition = array("email" => $email);
        $userResult = $userClass->find($condition);
        $nick = $userResult["nick"];
        $portraitUrl = $userResult["portraiturl"];
        $perCount = 5;
        $startIndex = $perCount * $pageIndex;
        $blogResult = $blogClass->findAll($condition, "blogid DESC", null, "$startIndex,$perCount");
        $returnArr = $this->result2html($blogResult);
        echo json_encode($returnArr);
    }

    function initIndex() {
        $blog = spClass("Blog");
        $email = $this->spArgs("email");
        $pageIndex = $this->spArgs("pageIndex");
        $perCount = 5;
        $startIndex = $perCount * $pageIndex;

        $condition = array("email" => $email);
        $resultArr = array();
        $sql = 'select * from blog where email = "' . $email . '" OR blogid IN(select blogid FROM blogtag
             WHERE tagname in(SELECT tagname FROM followtag WHERE email = "' . $email . '")) OR email IN(SELECT
             useremail from followuser WHERE email = "' . $email . '") ORDER BY blogid DESC LIMIT ' . $startIndex
            . ',' . $perCount;
        $blogResult = $blog->findSql($sql);
        $resultArr = $this->result2html($blogResult);
        echo json_encode($resultArr);
    }

//标签查找
    function showTag() {
        $blogTag = spClass("BlogTag");
        $tagName = $this->spArgs("tag");
        $sql = "SELECT * FROM blog WHERE blogid IN (SELECT blogid FROM blogtag WHERE tagname='$tagName') order by blogid desc";
        $blogResult = $blogTag->findSql($sql);
        $resultArr = $this->result2html($blogResult);
        echo json_encode($resultArr);
    }


    function createFeedHead($blogID, $email, $nick, $portraitUrl, $date) {
        $str = '<div class="feed"><div class="blogIDHide">' . $blogID . '</div>' .
            '<div class="emailHide">' . $email .
            '</div><div class="headDiv"><img src =' . $portraitUrl .
            '></div><div class="triangle"></div > ' .
            '<div class="feedDiv">' .
            '<div class="dateHolder">' .
            '<div class="author">' . $nick . '</div> ' .
            '<div class="dateDiv">' . $date . '</div></div> ';
        return $str;
    }

    function createFeedFoot($blogID, $tagsArr, $commentnum, $likenum) {
        $str = '<div class="attrHolder"><div class="tagsDiv">';
        $tagsShow = 3;
        if (count($tagsArr) < $tagsShow) {
            $tagsShow = count($tagsArr);
        }
        for ($i = 0; $i < $tagsShow; $i++) {
            $str .= '<span class="tagSpan">' . $tagsArr[$i] . '</span>';
        }
        if ($commentnum != 0) {
            $comment = spClass("Comment");
            $condition = array("blogid" => $blogID);
            $commentResult = $comment->findAll($condition, "commentid DESC");
        }
        $str .= '</div><div class="optionsDiv"><div class="optDiv removeDiv">删除</div ><div class="optDiv reprintDiv"> ' .
            '转载</div ><div class="optDiv commentDiv">回应(' . $commentnum . ')</div ><div class="optDiv likeDiv">★喜欢(' . $likenum . ') </div > ' .
            '</div></div></div><div class="feedComment">
                    <div class="cmtArea clearFix">
                        <textarea class="cmtText" rows = "" cols ="" ></textarea>

                        <div class="cmtButton" >
                            <span class="cmtSpan" >评论</span >
                        </div>
                    </div>
                    <div class="cmtList">
                        <ul class="cmtUl">';
        if ($commentResult) {
            foreach ($commentResult as $commentItem) {
                $email = $commentItem["email"];
                $content = $commentItem["content"];
                $str .= $this->createCommentLi($email, $content);
            }
        }

        $str .= '</ul >
                    </div >
                    <div class="shQi" >
                        <span class="shQiSpan" >收起↑</span >
                    </div >
                </div ></div > ';
        return $str;
    }

    function seeOne() {
        $hisEmail = $this->spArgs("hisEmail");
        $hisBlogID = $this->spArgs("hisBlogID");
        $boClass = spClass("Boke");
        $boResult = $boClass->find(array("email" => $hisEmail));
        $_SESSION["hisName"] = $boResult["bokename"];
        $_SESSION["hisBlogID"] = $hisBlogID;
        $arr["success"] = 1;
        echo json_encode($arr);
    }

    function createTxtDiv($title, $content) {
        $str = '<div class="titleDiv">' . $title . '</div>' .
            '<div class="contentDiv" >' . $content . '</div>';
        $str .= '<div class="seeHolder"><div class="seeAll">查看原文→</div></div>';
        return $str;
    }

    function createPicDiv($imgUrlArr, $descr) {

        $str = '<div class="picDiv" > ';
//            <img src="http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg">
//                <img src="http://i0.sinaimg.cn/ty/nba/idx/2012/1130/U1614P6T950D1F28796DT20121130105228.jpg">
//

        $picsShow = count($imgUrlArr);

        for ($i = 0; $i < $picsShow; $i++) {
            $str .= '<img src = ' . $imgUrlArr[$i] . ' > ';
        }
        $str .= '<div class="clear"></di ><div class="descDiv">&nbsp;&nbsp;' . $descr . ' </div></div></div> ';
        $str .= '<div class="seeHolder" ><div class="seeAll" >查看原文→</div > ';
        return $str;
    }

    function createVideoDiv($title, $imgUrl, $videoUrl) {

        $str = '<div class="titleDiv"> ' . $title . '</div>' .
            '<div class="videoDiv"><img src = "' . $imgUrl . '" alt = "">' .
            '<embed src = ' . $videoUrl . ' align = "middle" allowScriptAccess = "sameDomain "type ="application/x-shockwave-flash" ></embed > ' .
            '<div class="stopVideo" >收起↑</div><div class="clear"></div></div> ';
        return $str;
    }

    function createLinkDiv($title, $url) {

        $str = '<div class="titleDiv">' . $title . '</div> ' .
            '<div class="linkDiv"><a href = "' . $url . '"> ' . $url . '</a></div> ';
        return $str;
    }

    function createCommentLi($email, $comment) {
        $userClass = spClass("User");
        $condition = array("email" => $email);
        $userResult = $userClass->find($condition);
        $portraitUrl = $userResult["portraiturl"];
        $nick = $userResult["nick"];
        $str = '<li class="cmtLi"><div class="emailDiv"> ' . $email . '</div>' .
            '<img class="cmtPor" width = "32" height = "32" src = "' . $portraitUrl . '"/>' .
            '<div class="cmtMain"><div class="cmtNick"> ' . $nick . ' </div>' .
            '<span class="cmtContent"> ' . $comment . '</span></div></li>';
        return $str;
    }

    function getOne() {
        $blogTagClass = spClass("BlogTag");
        $blogID = $this->spArgs("blogID");
        $bo = spClass("Blog");
        $blog = $bo->find(array("blogid" => $blogID));
        $blogID = $blog["blogid"];
        $tagsArr = array();
        $blogTagResult = $blogTagClass->findAll(array("blogid" => $blogID));
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
        $email = $blog["email"];
        $userClass = spClass("User");
        $userResult = $userClass->find(array("email" => $email));
        $nick = $userResult["nick"];
        $portraitUrl = $userResult["portraiturl"];
        $divHead = $this->createFeedHead($blogID, $email, $nick, $portraitUrl, $date);
        $divFoot = $this->createFeedFoot($blogID, $tagsArr, $commentNum, $likeNum);
        //处理转载
        if ($type == 5) {
            $fromId = $blog["fromid"];
            $result = $bo->find(array("blogid" => $fromId));
            $type = $result["type"];
            $title = $result["title"];
            $url = $result["url"];
            $email = $result["email"];
            $content = $result["content"];
            $fromEmail = $result["email"];
            $fromUser = $userClass->find(array("email" => $fromEmail));
            $fromNick = $fromUser["nick"];
            $divHead = $this->createFeedHead($blogID, $email, "转载自 " . $fromNick, $portraitUrl, $date);
        }
        switch ($type) {
            case 1:
                $html = $divHead . $this->createTxtDiv($title, $content) . $divFoot;
                $returnArr["html"] = $html;
                break;
            case 2:
                $imgUrlArr = preg_split("/,/", $url);
                $html = $divHead . $this->createPicDiv($imgUrlArr, $title) . $divFoot;
                $returnArr["html"] = $html;
                break;
            case 3:
                $html = $divHead . $this->createLinkDiv($title, $url) . $divFoot;
                $returnArr["html"] = $html;
                break;
            case 4:
                $videoArr = $this->getVideoInfo($url);
                $imgUrl = $videoArr["imgUrl"];
                $swfUrl = $videoArr["swf"];
                $html = $divHead . $this->createVideoDiv($title, $imgUrl, $swfUrl) . $divFoot;
                $returnArr["html"] = $html;
                break;
        }

        echo json_encode($returnArr);
    }

    function result2html($blogResult) {
        $returnArr = array();
        $blogTagClass = spClass("BlogTag");
        $blogClass = spClass("Blog");
        foreach ($blogResult as $blog) {
            $blogID = $blog["blogid"];
            $tagsArr = array();
            $blogTagResult = $blogTagClass->findAll(array("blogid" => $blogID));
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
            $email = $blog["email"];
            $userClass = spClass("User");
            $userResult = $userClass->find(array("email" => $email));
            $nick = $userResult["nick"];
            $portraitUrl = $userResult["portraiturl"];
            $divHead = $this->createFeedHead($blogID, $email, $nick, $portraitUrl, $date);
            $divFoot = $this->createFeedFoot($blogID, $tagsArr, $commentNum, $likeNum);
            //处理转载
            if ($type == 5) {
                $fromId = $blog["fromid"];
                $result = $blogClass->find(array("blogid" => $fromId));
                $type = $result["type"];
                $title = $result["title"];
                $url = $result["url"];
                $email = $result["email"];
                $content = $result["content"];
                $fromEmail = $result["email"];
                $fromUser = $userClass->find(array("email" => $fromEmail));
                $fromNick = $fromUser["nick"];
                $divHead = $this->createFeedHead($blogID, $email, "转载自 " . $fromNick, $portraitUrl, $date);
            }
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
        return $returnArr;
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
