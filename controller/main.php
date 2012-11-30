<?php
header("Content-Type:text/html; charset=utf-8");
class main extends spController
{
    function index(){
        header("Location:view/index.php");
    }
}
