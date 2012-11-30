<?php
// If you want to ignore the uploaded files,
// set $demo_mode to true;
$demo_mode = false;
$upload_dir = 'upload/';
$allowed_ext = array('jpg', 'jpeg', 'png', 'gif');

function genRandomString($len) {
    $chars = array(
        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
        "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
        "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
        "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
        "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
        "3", "4", "5", "6", "7", "8", "9"
    );
    $charsLen = count($chars) - 1;
    shuffle($chars); // 将数组打乱
    $output = "";
    for ($i = 0; $i < $len; $i++) {
        $output .= $chars[mt_rand(0, $charsLen)];
    }
    return $output;
}

if (strtolower($_SERVER['REQUEST_METHOD']) != 'post') {
    exit_status('Error! Wrong HTTP method!');
}


if (array_key_exists('pic', $_FILES) && $_FILES['pic']['error'] == 0) {

    $pic = $_FILES['pic'];

    if (!in_array(get_extension($pic['name']), $allowed_ext)) {
        exit_status('Only ' . implode(',', $allowed_ext) . ' files are allowed!');
    }

    if ($demo_mode) {

// File uploads are ignored. We only log them.

        $line = implode('        ', array(date('r'), $_SERVER['REMOTE_ADDR'], $pic['size'], $pic['name']));
        file_put_contents('log.txt', $line . PHP_EOL, FILE_APPEND);

        exit_status('Uploads are ignored in demo mode.');
    }


// Move the uploaded file from the temporary
// directory to the uploads folder:
    $arr = explode(".", $pic['name']);
    $count = count($arr);
    $type = $arr[$count - 1];
    $name = "temp_" . genRandomString(12) . "." . $type;
    if (move_uploaded_file($pic['tmp_name'], $upload_dir . $name)) {
        exit_status('File was uploaded successfuly!');
    }

}

exit_status('Something went wrong with your upload!');


// Helper functions

function exit_status($str) {
    echo json_encode(array('status' => $str));
    exit;
}

function get_extension($file_name) {
    $ext = explode('.', $file_name);
    $ext = array_pop($ext);
    return strtolower($ext);
}

?>