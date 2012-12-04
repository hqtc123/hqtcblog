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
        $blogTag = spClass("BlogTag");
//add to blog
        $type = $this->spArgs("type");
        $date = $this->spArgs("date");
        $commentNum = $this->spArgs("commentNum");
        $likeNum = $this->spArgs("likeNum");
        $email = $this->spArgs("email");


//txt pic link video
        switch ($type) {
            case 1:
                $title = $this->spArgs("title");
                $content = $this->spArgs("content");
                $url = " ";
                break;
            case 2:
                $title = $this->spArgs("descr");
                $imgPath = "";
                $path = dirname(__FILE__);
                $path = str_replace("controller", "view/upload", $path);
                $path = str_replace("\\", "/", $path);
                $handler = opendir($path);
                while (($filename = readdir($handler)) !== false) {
                    if ($filename != "." && $filename != "..") {
                        if (preg_match("/^temp_/", $filename, $r)) {
                            $newName = str_replace("temp_", "", $filename);
                            rename($path . "/" . $filename, $path . "/" . $newName);
                            $relative = "upload" . "/" . $newName;
                            $imgPath = $imgPath . $relative . ",";
                        }
                    }
                }
                closedir($handler);
//                $this->result = $this->addPicBlog($id, $imgPath, $desc);
//                $feedArr = array("url" => $imgPath, "descr" => $descr);
//                $feed = json_encode($feedArr);
                $url = $imgPath;
                $content = "";
                break;
            case 3:
                $title = $this->spArgs("title");
                $url = $this->spArgs("link");
                $content = "";
                break;
            case 4:
                $title = $this->spArgs("title");
                $url = $this->spArgs("link");
                $content = "";
                break;
            default:

        }
        $newRow = array('type' => $type, 'email' => $email, 'date' => $date,
            'commentnum' => $commentNum, 'likenum' => $likeNum, 'title' => $title, "url" => $url, "content" => $content);

        $blogId = $blog->create($newRow);
        $this->result = true;
//deal the tag
        $tagStr = $this->spArgs("tagStr");
        if ($tagStr != "") {
            $tagArr = preg_split("/,/", $tagStr);
            foreach ($tagArr as $tag) {
                $condition = array("blogid" => $blogId, "tagname" => $tag);
                if (!$blogTag->find($condition)) {
                    $blogTag->create($condition);
                }
            }
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
        } else {
            $arr["success"] = 0;
            $arr["msg"] = "发布失败，请重试";
        }
        echo json_encode($arr);
    }

    function cancelPic() {
        $path = dirname(__FILE__);
        $path = str_replace("controller", "view/upload", $path);
        $path = str_replace("\\", "/", $path);
        $handler = opendir($path);
        $result = true;
        while (($filename = readdir($handler)) !== false) {
            if ($filename != "." && $filename != "..") {
                if (preg_match("/^temp_/", $filename, $r)) {
                    $result = unlink($path . "/" . $filename);
                }
            }
        }
        closedir($handler);
        if ($result) {
            $arr["success"] = 1;
        } else {
            $arr["success"] = 0;
        }
        echo json_encode($arr);
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

    function removeBlog() {
        $blogClass = spClass("Blog");
        $blogID = $this->spArgs("blogID");
        $condition = array("blogid" => $blogID);
        $result = $blogClass->delete($condition);
        if ($result) {
            $arr["success"] = 1;
            $arr["msg"] = "删除成功";
        } else {
            $arr["success"] = 0;
        }
        echo json_encode($arr);
    }


}

//$coo=new BlogController();
//var_dump($coo->getTempArr());

