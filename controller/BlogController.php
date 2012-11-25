<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-15
 * Time: 上午10:22
 * To change this template use File | Settings | File Templates.
 */
class BlogController extends spController {
    var $result = false;

    function addBlog() {
        $blog = spClass("Blog");
        $picBlog = spClass("PicBlog");
        $tagClass = spClass("tag");
        $blogTag = spClass("BlogTag");
//add to blog
        $type = $this->spArgs("type");
        $date = $this->spArgs("date");
        $commentNum = $this->spArgs("commentNum");
        $email = $this->spArgs("email");

        $newRow = array("type" => $type, "email" => $email, "date" => $date, "commentnum" => $commentNum);
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
                break;
            case 4:
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

    function updateBlog() {

    }
}
