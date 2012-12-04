<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-14
 * Time: 下午7:49
 * To change this template use File | Settings | File Templates.
 */
session_start();
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

    function toHisBo() {
        $userClass = spClass("User");
        $hisEmail = $this->spArgs("hisEmail");
        $boClass = spClass("Boke");
        $boResult = $boClass->find(array("email" => $hisEmail));
        $_SESSION["hisName"] = $boResult["bokename"];
        $result = $userClass->find(array("email" => $hisEmail));
        $_SESSION["hisNick"] = $result["nick"];
        $_SESSION["hisUrl"] = $result["portraiturl"];
        $_SESSION["hisEmail"] = $hisEmail;
        $arr["success"] = 1;
        echo json_encode($arr);
    }
}
