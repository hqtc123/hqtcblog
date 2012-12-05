<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-12-5
 * Time: 上午10:55
 * To change this template use File | Settings | File Templates.
 */
class ChildController extends spController {
    function addChild() {
        $child = spClass("ChildBlog");
        $name = $this->spArgs("name");
        $email = $this->spArgs("email");
        $child->create(array("email" => $email, "name" => $name));
        $arr["success"] = 1;
        $arr["msg"] = "创建成功";
        echo json_encode($arr);
    }

    function showChild() {
        $child = spClass("childBlog");
        $result = $child->findAll();
        $user = spClass("User");
        $arr = array();
        foreach ($result as $child) {
            $boName = $child["name"];
            $email = $child["email"];
            $ur = $user->find(array("email" => $email));
            $poUrl = $ur["portraiturl"];
            $str = '<div id="user">
                <div id="infoDiv">
                    <div id="userPic">
                        <img src="' . $poUrl . '" alt="">
                    </div>
                    <div class="boDiv">
                        <span class="boSpan">' . $boName . '</span>
                        <span class="emHide">' . $email . '</span>
                    </div>
                </div>
            </div>';
            $arr[] = $str;
        }
        echo json_encode($arr);
    }
}
