<?php

session_start();
include('include/header.php');
// TODO: ADD PERMISSIONS
function users_list() {
    global $Smarty;
    $Smarty->assign('users_list', User::S()->GetAllUsers());
    display('adm_users/list.tpl');
}
function users_error($users_error) {
    global $Smarty;
    $Smarty->assign('userss_error', $users_error);
    display('adm_users/error.tpl');
}
if (filter_input(INPUT_GET, 'do')) {
    switch (filter_input(INPUT_GET, 'do')) {
        case 'edit':
            display('adm_users/edit.tpl');
            break;
        case 'submit':

            break;
        case 'delete':
            display('adm_users/delete.tpl');
            break;
        case 'delete_confirm':

            break;
        case 'add_metadata':
            break;
        case 'del_metadata':
            break;
        case 'confirmdel_metadata':
            break;
        case 'edit_metadata':
            break;
        case 'submit_metadata':
            break;
        case 'list':
        default:
            users_list();
            break;
    }
} else users_list();