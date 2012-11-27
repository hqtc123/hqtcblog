<?php
/**
 * Created by JetBrains PhpStorm.
 * User: hqtc
 * Date: 12-11-9
 * Time: 下午4:18
 * To change this template use File | Settings | File Templates.
 */
session_start();
header("Content-Type:text/html; charset=utf-8");
class UserController extends spController {
    var $user;
    var $arr;
    var $email, $password;
    var $nick;

    function register() {
        $this->user = spClass("User");
        $this->email = $this->spArgs("email");
        $conditions = array("email" => $this->email);
        if ($result = $this->user->find($conditions)) {
            $arr["success"] = 0;
            $arr["msg"] = "抱歉，您填写的邮箱已经被使用……";
            echo json_encode($arr);
        } else {
            $boke = spClass("Boke");
            $newRow = array("email" => $this->email, "bokename" => "我的博客");
            $boke->create($newRow);

            $this->password = $this->spArgs("password");
            $this->nick = $this->spArgs("nick");
            $newRow = array(
                "email" => $this->email,
                "password" => $this->password,
                "nick" => $this->nick,
                "portraiturl" => ""
            );
            $this->user->create($newRow);
            $_SESSION["email"] = $this->email;
            $_SESSION["nick"] = $this->nick;
            $_SESSION["bokeName"] = "我的博客";
            $arr["success"] = 1;
            $arr["msg"] = "注册成功，欢迎使用环球探测轻博客……";
            echo json_encode($arr);
        }
    }

    function login() {
        $this->user = spClass("User");
        $this->email = $this->spArgs("email");
        $this->password = $this->spArgs("password");
        $conditions = array("email" => $this->email);
        $result = $this->user->find($conditions);
        if ($result) {
            if ($this->password == $result["password"]) {
                $nick = $result["nick"];
                $url = $result["portraiturl"];
                $boKe = spClass("Boke");
                $condition = array("email" => $this->email);
                if ($resultBoKe = $boKe->find($condition)) {
                    $_SESSION["bokeName"] = $resultBoKe["bokename"];
                } else {
                    $_SESSION["bokeNum"] = 0;
                }
                $_SESSION["nick"] = $nick;
                $_SESSION["url"] = $url;
                $_SESSION["email"] = $this->email;
                $arr["success"] = 1;
                echo json_encode($arr);
            } else {
                $arr["success"] = 0;
                $arr["msg"] = "用户邮箱或者密码错误";
                echo json_encode($arr);
            }
        } else {
            $arr["success"] = 0;
            $arr["msg"] = "此用户邮箱不存在";
            echo json_encode($arr);
        }
    }

    function logout() {
        if (isset($_SESSION["nick"])) {
            unset($_SESSION["nick"]);
            unset($_SESSION["email"]);
            unset($_SESSION["bokeName"]);
            unset($_SESSION["url"]);
            $arr["success"] = 1;
            $arr["msg"] = "退出成功";
            echo json_encode($arr);
        }
    }
}
