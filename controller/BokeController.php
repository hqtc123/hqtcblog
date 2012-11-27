<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-14
 * Time: 下午7:49
 * To change this template use File | Settings | File Templates.
 */
class BokeController extends spController {
    function addBoke() {
        $boke = spClass("Boke");
        $user = spClass("User");
        $email = $this->spArgs("email");
        $bokeName = $this->spArgs("bokeName");
        $portraitUrl = $this->spArgs("portraitUrl");
        $condition = array("email" => $email);
        if ($_SESSION["url"] != $portraitUrl) {
            $newRow = array("portraiturl" => $portraitUrl);
            $user->update($condition, $newRow);
        }
        if ($_SESSION["bokeName"] != $bokeName) {
            $newRow = array("email" => $email, "bokename" => $bokeName);
            $boke->update($condition, $newRow);
        }
        $_SESSION["bokeName"] = $bokeName;
        $_SESSION["url"] = $portraitUrl;
        $arr["success"] = 1;
        $arr["msg"] = "设置成功";
        echo json_encode($arr);
    }

    function updateBoke() {

    }

    function deleteBoke() {

    }
}
