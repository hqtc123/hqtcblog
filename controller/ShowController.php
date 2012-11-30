<?php
/**
 * Created by JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-30
 * Time: 下午4:47
 * To change this template use File | Settings | File Templates.
 */
class ShowController extends spController {
    function initMyBlog() {
        $blogClass = spClass("Blog");
        $email = $this->spArgs("email");
        $pageIndex = $this->spArgs("pageIndex");
        $condition = array("email" => $email);
        $perCount = 10;


    }
}
