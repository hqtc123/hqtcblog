<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-27
 * Time: 下午11:13
 * To change this template use File | Settings | File Templates.
 */
class ShowFeedController extends spController {
    function getMyBlog() {
        $blogClass = spClass("Blog");
        $txtBlog = spClass("TxtBlog");
        $picBlog = spClass("PicBlog");
        $linkBlog = spClass("LinkBlog");
        $videoBlog = spClass("VideoBlog");
        $email = $this->spArgs("email");
        $condition = array("email" => $email);
        $result = $blogClass->findAll($condition);
        foreach ($result as $blogItem) {
            $arr["date"] = $blogItem["date"];
            $arr["commentNum"] = $blogItem["commentnum"];
            $arr["likeNum"] = $blogItem["likenum"];
            $type = $blogItem["type"];
            switch ($type) {
                case 1:
                    $arr["type"] = 1;
                    $arr["title"] = $blogItem["title"];
                    $arr["content"] = $blogItem["content"];
                    break;
            }
        }
    }

    function getIndexBLog() {

    }
}
