<?php

session_start();
include('include/header.php');
// TODO: ADD PERMISSIONS
function articles_list() {
    global $Smarty;
    $Smarty->assign('articles_list', Article::S()->ListArticles());
    display('adm_articles/list.tpl');
}
function articles_error($articles_error) {
    global $Smarty;
    $Smarty->assign('articles_error', $articles_error);
    display('adm_articles/error.tpl');
}
if (filter_input(INPUT_GET, 'do')) {
    switch (filter_input(INPUT_GET, 'do')) {
        case 'add':
            display('adm_articles/add.tpl');
            break;
        case 'edit':
            display('adm_articles/edit.tpl');
            break;
        case 'submit':

            break;
        case 'delete':
            display('adm_articles/delete.tpl');
            break;
        case 'delete_confirm':

            break;
        case 'add_metadata':
            display('adm_articles/add_metadata.tpl');
            break;
        case 'del_metadata':
            display('adm_articles/del_metadata.tpl');
            break;
        case 'confirmdel_metadata':
            break;
        case 'edit_metadata':
            display('adm_articles/edit_metadata.tpl');
            break;
        case 'submit_metadata':
            break;
        case 'list':
        default:
            articles_list();
            break;
    }
} else articles_list();