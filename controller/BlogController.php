<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-15
 * Time: 上午10:22
 * To change this template use File | Settings | File Templates.
 */
require_once "VideoUrlParser.class.php";
header("Content-Type:text/html; charset=utf-8");
class BlogController extends spController {
    var $result = false;

    function addBlog() {
        $blog = spClass("Blog");
        $tagClass = spClass("Tag");
        $blogTag = spClass("BlogTag");
//add to blog
        $type = $this->spArgs("type");
        $date = $this->spArgs("date");
        $commentNum = $this->spArgs("commentNum");
        $likeNum = $this->spArgs("likeNum");
        $email = $this->spArgs("email");

        $newRow = array("type" => $type, "email" => $email, "date" => $date,
            "commentnum" => $commentNum, "likenum" => $likeNum);
        $id = $blog->create($newRow);

//deal the tag
        $tagStr = $this->spArgs("tagStr");
        if ($tagStr != "") {
            $tagArr = preg_split("/,/", $tagStr);
            foreach ($tagArr as $tag) {
                $condition = array("tagname" => $tag);
                if (!$tagClass->find($condition)) {
                    $tagClass->create($condition);
                }
                $condition2 = array("blogid" => $id, "tagname" => $tag);
                if (!$blogTag->find($condition2)) {
                    $blogTag->create($condition2);
                }
            }
        }

//txt pic music video
        switch ($type) {
            case 1:
                $title = $this->spArgs("title");
                $content = $this->spArgs("content");
                $this->result = $this->addTxtBlog($id, $title, $content);
                break;
            case 2:
                break;
            case 3:
                $title = $this->spArgs("title");
                $link = $this->spArgs("link");
                $this->result = $this->addLinkBlog($id, $title, $link);
                break;
            case 4:
                $title = $this->spArgs("title");
                $link = $this->spArgs("link");
                $this->result = $this->addVideoBlog($id, $title, $link);
                break;
            default:

        }


//        if (count($tagsArr) != 0) {
//            foreach ($tagsArr as $tag) {
//                $tagController->addTag($tag);
//                $blogTagController->addBlogTag($id, $tag);
//            }
//        }
        if ($this->result) {
            $arr["success"] = 1;
            $arr["msg"] = "发布成功";
        }
        echo json_encode($arr);
    }

    function addTxtBlog($id, $title, $content) {
        $txtBlog = spClass("TxtBlog");
        $newRow = array("blogid" => $id, "title" => $title, "content" => $content);
        $txtBlog->create($newRow);
        return true;
    }

    function addVideoBlog($id, $title, $link) {
        $videoBlog = spClass("VideoBlog");
        $newRow = array("blogid" => $id, "title" => $title, "link" => $link);
        $videoBlog->create($newRow);
        return true;
    }

    function addLinkBlog($id, $title, $link) {
        $linkBlog = spClass("LinkBlog");
        $newRow = array("blogid" => $id, "title" => $title, "link" => $link);
        $linkBlog->create($newRow);
        return true;
    }

    //抓取视频信息
    function getVideoInfo() {
        $url = $this->spArgs("link");
        $info = VideoUrlParser::parse($url);
        if ($info == false) {
            $arr["success"] = 0;
            $arr["msg"] = "抱歉，我们无法识别此链接";
            echo json_encode($arr);
            return false;
        }
        $arr["title"] = $info["title"];
        $arr["imgUrl"] = $info["img"];
        $arr["success"] = 1;
        echo json_encode($arr);
    }

    function updateBlog() {

    }
}
