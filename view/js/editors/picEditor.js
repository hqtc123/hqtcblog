/**
 * Created with JetBrains PhpStorm.
 * User: He Qing
 * Date: 12-11-28
 * Time: 下午1:04
 * To change this template use File | Settings | File Templates.
 */
function getBaseUrl() {
    var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0, pos);
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    return (localhostPaht + projectName);
}
Date.prototype.format = function (formatStr) {
    var str = formatStr;
    str = str.replace(/yyyy|YYYY/, this.getFullYear());
    str = str.replace(/MM|mm/, (this.getMonth() + 1) > 9 ? (this.getMonth() + 1).toString() : '0' + (this.getMonth() + 1));
    str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
    return str;
}
$(function () {
    $("#tag_text").tagsInput({width:"500px", height:"36px", defaultText:'按Enter确定', placeholderColor:"#888"});
    var email = $("#hide_email").html();
    var nick = $("#account").html();
    var uploaded = false;
    var dropbox = $('#dropbox'),
        message = $('.message', dropbox);

    dropbox.filedrop({
        // The name of the $_FILES entry:
        paramname:'pic',
        maxfiles:5,
        maxfilesize:2,
        url:'post_file.php',

        uploadFinished:function (i, file, response) {
            $.data(file).addClass('done');
            // response is the JSON object that post_file.php returns
            uploaded = true;
        },

        error:function (err, file) {
            switch (err) {
                case 'BrowserNotSupported':
                    showMessage('Your browser does not support HTML5 file uploads!');
                    break;
                case 'TooManyFiles':
                    alert('Too many files! Please select 5 at most! (configurable)');
                    break;
                case 'FileTooLarge':
                    alert(file.name + ' is too large! Please upload files up to 2mb (configurable).');
                    break;
                default:
                    break;
            }
        },

        // Called before each upload is started
        beforeEach:function (file) {
            if (!file.type.match(/^image\//)) {
                alert('Only images are allowed!');

                // Returning false will cause the
                // file to be rejected
                return false;
            }
        },

        uploadStarted:function (i, file, len) {
            createImage(file);
        },

        progressUpdated:function (i, file, progress) {
            $.data(file).find('.progress').width(progress);
        }

    });

    var template = '<div class="preview">' +
        '<span class="imageHolder">' +
        '<img />' +
        '<span class="uploaded"></span>' +
        '</span>' +
        '<div class="progressHolder">' +
        '<div class="progress"></div>' +
        '</div>' +
        '</div>';


    function createImage(file) {

        var preview = $(template),
            image = $('img', preview);

        var reader = new FileReader();

        image.width = 100;
        image.height = 100;

        reader.onload = function (e) {

            // e.target.result holds the DataURL which
            // can be used as a source of the image:

            image.attr('src', e.target.result);
        };

        // Reading the file as a DataURL. When finished,
        // this will trigger the onload function above:
        reader.readAsDataURL(file);

        message.hide();
        preview.appendTo(dropbox);

        // Associating a preview container
        // with the file, using jQuery's $.data():

        $.data(file, preview);
    }

    function showMessage(msg) {
        message.html(msg);
    }

    $(".pb-submit").click(function () {
        if (!uploaded) {
            $.dialog({
                title:"错误",
                content:"您还未上传图片"
            });
            return false;
        }
        var date = new Date().format("yyyy-mm-dd");
        var tagStr = $("#tag_text").val();
        var descr = $("#pb-desc").val();
        $.ajax({
            type:"POST",
            dataType:"json",
            url:getBaseUrl() + "/index.php?c=BlogController&a=addBlog",
            data:{
                "type":2,
                "tagStr":tagStr,
                "descr":descr,
                "date":date,
                "commentNum":0,
                "likeNum":0,
                "email":email
            },
            success:function (result) {
                $.dialog({
                    title:"提示",
                    content:result.msg
                });
                if (result.success == 1) {
                    setTimeout("javascript:location.href='../view/myblog.php'", 100);
                }
            }
        })
    });
    $(".pb-cancel").click(function () {
        $.ajax({
            type:"POST",
            dataType:"json",
            url:getBaseUrl() + "/index.php?c=BlogController&a=cancelPic",
            success:function (result) {
                if (result.success == 1) {
                    setTimeout("javascript:location.href='../view/myblog.php'", 100);
                }
            }
        })
    });
});