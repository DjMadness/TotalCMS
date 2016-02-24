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
            if (filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT)) {
                $Smarty->assign('users_list', User::S()->GetByUserid(filter_input(INPUT_GET, 'id')));
                display('adm_users/edit.tpl');
            } else users_error('user does not exist');
            break;
        case 'submit':

            break;
        case 'delete':
            if (filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT)) {
                $Smarty->assign('users_list', User::S()->GetByUserid(filter_input(INPUT_GET, 'id')));
                display('adm_users/delete.tpl');
            } else users_error('user does not exist');
            break;
        case 'delete_confirm':
            break;
        case 'add_metadata':
            display('adm_users/add_metadata.tpl');
            break;
        case 'del_metadata':
            display('adm_users/del_metadata.tpl');
            break;
        case 'confirmdel_metadata':
            break;
        case 'del_profile':
            display('adm_users/del_profile.tpl');
            break;
        case 'add_profile':
            display('adm_users/add_profile.tpl');
            break;
        case 'submit_metadata':
            break;
        case 'list':
        default:
            users_list();
            break;
    }
} else users_list();