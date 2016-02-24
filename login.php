<?php

session_start();
include('include/header.php');
if (filter_input(INPUT_POST, 'login_submit')) {
    if(filter_input(INPUT_POST, 'login_username')) $login_username = filter_input(INPUT_POST, 'login_username', FILTER_SANITIZE_STRING);
    if(filter_input(INPUT_POST, 'login_password')) $login_password = filter_input(INPUT_POST, 'login_password', FILTER_SANITIZE_STRING);
    if((isset($login_username)) && (isset($login_password))) {
        if(User::S()->Login($login_username, $login_password) == true)
            header('location: index.php');
        else {
            $Smarty->assign('login_error', 'Invalid user/pass combination');
            display('login.tpl');
        }
    }
} else display('login.tpl');