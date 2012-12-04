<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-12-3
 * Time: 下午5:35
 * To change this template use File | Settings | File Templates.
 */
class CLPController extends spController {
    function addLike() {
        $likesClass = spClass("Likes");
        $blogClass = spClass("Blog");
        $email = $this->spArgs("email");
        $blogID = $this->spArgs("blogID");

        $newRow = array("email" => $email, "blogid" => $blogID);
        if ($likesClass->find($newRow)) {
            $arr["success"] = 0;
            $arr["msg"] = "您已经表达过喜欢了";
        } else {
            $likesClass->create($newRow);
            $count = $likesClass->findCount(array("blogid" => $blogID));
            $blogClass->update(array("blogid" => $blogID), array("likenum" => $count));
            $arr["success"] = 1;
            $arr["num"] = $count;
        }
        echo json_encode($arr);
    }

    function addComment() {
        $commentClass = spClass("Comment");
        $email = $this->spArgs("email");
        $comment = $this->spArgs("comment");
        $blogID = $this->spArgs("blogID");
        $newRow = array("content" => $comment, "email" => $email, "blogid" => $blogID);
        $result = $commentClass->create($newRow);
        if ($result) {
            $blog = spClass("Blog");
            $condition = array("blogid" => $blogID);
            $blogResult = $blog->find($condition);
            $commentNum = $blogResult["commentnum"];
            $commentNum++;
            $blog->update($condition, array("commentnum" => $commentNum));
            $divStr = $this->createCommentLi($email, $comment);
            $arr["success"] = 1;
            $arr["divStr"] = $divStr;
            $arr["commentNum"] = $commentNum;
        }

        echo json_encode($arr);
    }

    function addReprint() {
        $blog = spClass("Blog");
        $email = $this->spArgs("email");
        $date = $this->spArgs("date");
        $type = $this->spArgs("type");
        $fromID = $this->spArgs("fromID");
        $result = $blog->find(array("blogid" => fromID));
        if ($result["fromid"] != "") {
            $fromID = $result["fromid"];
        }
        $newRow = array("email" => $email, "date" => $date, "commentnum" => 0, "likenum" => 0, "type" => $type, "fromid" => $fromID);
        $blog->create($newRow);
        $arr["success"] = 1;
        $arr["msg"] = "转载成功，内容已经发布在您的博客中";
        echo json_encode($arr);
    }

    function createCommentLi($email, $comment) {
        $userClass = spClass("User");
        $condition = array("email" => $email);
        $userResult = $userClass->find($condition);
        $portraitUrl = $userResult["portraiturl"];
        $nick = $userResult["nick"];
        $str = '<li class="cmtLi"><div class="emailDiv">' . $email . '</div>' .
            '<img class="cmtPor" width="32" height="32" src="' . $portraitUrl . '"/>' .
            '<div class="cmtMain"><div class="cmtNick">' . $nick . ' </div>' .
            '<span class="cmtContent">' . $comment . '</span></div> </li>';
        return $str;
    }
}
