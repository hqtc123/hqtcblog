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
    function register() {
        $user = spClass("User");
        $email = $this->spArgs("email");
        $conditions = array("email" => $email);
        if ($result = $user->find($conditions)) {
            $arr["success"] = 0;
            $arr["msg"] = "抱歉，您填写的邮箱已经被使用……";
            echo json_encode($arr);
        } else {
            $password = $this->spArgs("password");
            $nick = $this->spArgs("nick");
            $newrow = array(
                "email" => $email,
                "password" => $password,
                "nick" => $nick,
            );
            $_SESSION["email"] = $email;
            $_SESSION["nick"] = $nick;
            $user->create($newrow);
            $arr["success"] = 1;
            $arr["msg"] = "注册成功，欢迎使用环球探测轻博客……";
            echo json_encode($arr);
        }
    }

    function login() {
        $user = spClass("User");
        $email = $this->spArgs("email");
        $password = $this->spArgs("password");
        $conditions = array("email" => $email);
        $result = $user->find($conditions);
        if ($result) {
            if ($password == $result["password"]) {
                $nick = $result["nick"];
                $boke = spClass("Boke");
                $condition = array("email" => $email);
                if ($resultBoke = $boke->find($condition)) {
                    $_SESSION["bokeName"] = $resultBoke["bokename"];
                } else {
                    $_SESSION["bokeNum"] = 0;
                }
                $_SESSION["nick"] = $nick;
                $_SESSION["email"] = $email;
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
            if (isset($_SESSION["bokeName"])) {
                unset($_SESSION["bokeName"]);
            }
            $arr["success"] = 1;
            $arr["msg"] = "退出成功";
            echo json_encode($arr);
        }
    }
}
