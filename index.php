<?php
define("APP_PATH", dirname(__FILE__));
define("SP_PATH", dirname(__FILE__) . '/SpeedPHP');
$spConfig = array(
    "db" => array( // 数据库设置
        'host' => 'localhost', // 数据库地址，一般都可以是localhost
        'login' => 'root', // 数据库用户名
        'password' => '123456', // 数据库密码
        'database' => 'hqtcblog', // 数据库的库名称
    ),
    'view' => array(
        'enabled' => TRUE, // 开启Smarty
        'config' => array(
            'template_dir' => APP_PATH . '/tpl', // 模板存放的目录
            'compile_dir' => APP_PATH . '/tmp', // 编译的临时目录
            'cache_dir' => APP_PATH . '/tmp', // 缓存的临时目录
            'left_delimiter' => '<{', // smarty左限定符
            'right_delimiter' => '}>', // smarty右限定符
        ),
    ),
);
require(SP_PATH . "/SpeedPHP.php");
spRun();