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
        $followTag = spClass("FollowTag");
        $email = $this->spArgs("email");
        $tag = $this->spArgs("tag");
        if ($followTag->find(array("email" => $email, "tagname" => $tag))) {
            $followTag->delete(array("email" => $email, "tagname" => $tag));
        }
        $arr["success"] = 1;
        echo json_encode($arr);
    }

    function showFollowBo() {
        $followUser = spClass("FollowUser");
        $bo = spClass("Boke");
        $user = spClass("User");
        $email = $this->spArgs("email");
        $result = $followUser->findAll(array("email" => $email));
        $arr = array();
        foreach ($result as $fu) {
            $boMail = $fu["useremail"];
            $rr = $bo->find(array("email" => $boMail));
            $boName = $rr["bokename"];
            $rr2 = $user->find(array("email" => $boMail));
            $poUrl = $rr2["portraiturl"];
            $str = '<div id="user">
                <div id="infoDiv">
                    <div id="userPic">
                        <img src="' . $poUrl . '" alt="">
                    </div>
                    <div class="boDiv">
                        <span class="boSpan">' . $boName . '</span>
                        <span class="emHide">' . $boMail . '</span>
                    </div>
                </div>
            </div>';
            $arr[] = $str;
        }
        echo json_encode($arr);
    }

//获得关注标签
    function getFollowTag() {
        $email = $this->spArgs("email");
        $followTag = spClass("FollowTag");
        $arr = array();
        $result = $followTag->findAll(array("email" => $email));
        foreach ($result as $foo) {
            $arr[] = $foo["tagname"];
        }
        echo json_encode($arr);
    }

    function getFollowUserCount() {
        $email = $this->spArgs("email");
        $followUser = spClass("FollowUser");
        $result = $followUser->findAll(array("email" => $email));
        $arr["num"] = count($result);
        echo json_encode($arr);
    }

    function findFollow() {
        $email = $this->spArgs("email");
        $tag = $this->spArgs("tag");
        $followTag = spClass("FollowTag");
        $result = $followTag->findAll(array("email" => $email, "tagname" => $tag));
        if ($result) {
            $arr["follow"] = 1;
        } else {
            $arr["follow"] = 0;
        }
        echo json_encode($arr);
    }

}
