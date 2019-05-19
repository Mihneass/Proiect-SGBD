<?php
setcookie("is_logged",0,time()+(86400*10),"/");
    setcookie("user",0,time()-(86400*10),"/");
    header('Location: /sgbd/index.php');
?>