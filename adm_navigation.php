<?php

session_start();
include('include/header.php');
// TODO: ADD PERMISSIONS
function navigation_list() {
    global $Smarty;
    $Smarty->assign('navigation_list', Navigation::S()->ListNav());
    display('adm_navigation/list.tpl');
}
function articles_error($navigation_error) {
    global $Smarty;
    $Smarty->assign('navigation_error', $navigation_error);
    display('adm_navigation/error.tpl');
}
if (filter_input(INPUT_GET, 'do')) {
    switch (filter_input(INPUT_GET, 'do')) {
        case 'add':
            display('adm_navigation/add.tpl');
            break;
        case 'edit':
            display('adm_navigation/edit.tpl');
            break;
        case 'submit':

            break;
        case 'delete':
            display('adm_navigation/delete.tpl');
            break;
        case 'reorder':
            display('adm_navigation/reorder.tpl');
            break;
        case 'delete_confirm':

            break;
        case 'list':
        default:
            navigation_list();
            break;
    }
} else navigation_list();