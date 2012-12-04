<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-12-3
 * Time: 下午4:00
 * To change this template use File | Settings | File Templates.
 */
class FollowController extends spController {
    function check() {
        $followUser = spClass("FollowUser");
        $email = $this->spArgs("email");
        $hisEmail = $this->spArgs("hisEmail");
        $result = $followUser->find(array("email" => $email, "useremail" => $hisEmail));
        if ($result) {
            $arr["follow"] = 1;
        } else {
            $arr["follow"] = 0;
        }
        echo json_encode($arr);
    }

    function addFollowUser() {
        $followUser = spClass("FollowUser");
        $email = $this->spArgs("email");
        $hisEmail = $this->spArgs("hisEmail");
        $result = $followUser->create(array("email" => $email, "useremail" => $hisEmail));
        if ($result) {
            $arr["success"] = 1;
        } else {
            $arr["success"] = 0;
        }
        echo json_encode($arr);
    }

    function removeFollowUser() {
        $followUser = spClass("FollowUser");
        $email = $this->spArgs("email");
        $hisEmail = $this->spArgs("hisEmail");
        $result = $followUser->delete(array("email" => $email, "useremail" => $hisEmail));
        if ($result) {
            $arr["success"] = 1;
        } else {
            $arr["success"] = 0;
        }
        echo json_encode($arr);
    }

    function addFollowTag() {
        $followTag = spClass("FollowTag");
        $email = $this->spArgs("email");
        $tag = $this->spArgs("tag");
        if ($followTag->find(array("email" => $email, "tagname" => $tag))) {
            $arr["success"] = 1;
        } else {
            $result = $followTag->create(array("email" => $email, "tagname" => $tag));
            if ($result) {
                $arr["success"] = 1;
            } else {
                $arr["success"] = 0;
            }
        }
        echo json_encode($arr);
    }

    function removeFollowTag() {

    }

}
