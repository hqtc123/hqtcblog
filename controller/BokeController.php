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
        $user = spClass("user");
        $email = $this->spArgs("email");
        $bokeName = $this->spArgs("bokeName");
        $portraitUrl = $this->spArgs("portraitUrl");
        $condition = array("email" => $email);
        $newRow = array("portraiturl" => $portraitUrl);
        $user->update($condition, $newRow);
        $newRow = array("email" => $email, "bokename" => $bokeName);
        $boke->create($newRow);
        $_SESSION["bokeName"] = $bokeName;
        $_SESSION["url"] = $portraitUrl;
        $arr["success"] = 1;
        $arr["msg"] = "您的blog" . $bokeName . "已经创建成功";
        echo json_encode($arr);
    }

    function updateBoke() {

    }

    function deleteBoke() {

    }
}
