<?php

session_start();
include('include/header.php');
// TODO: ADD PERMISSIONS
function settings_list() {
    global $Smarty;
    $Smarty->assign('settings_list', Settings::S()->ListSettings());
    display('adm_settings/list.tpl');
}
function settings_error($settings_error) {
    global $Smarty;
    $Smarty->assign('settings_error', $settings_error);
    display('adm_settings/error.tpl');
}
if (filter_input(INPUT_GET, 'do')) {
    switch (filter_input(INPUT_GET, 'do')) {
        case 'add':
            display('adm_settings/add.tpl');
            break;
        case 'edit':
            if (filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT)) {
                $settings_list = Settings::S()->GetById(filter_input(INPUT_GET, 'id'));
                if ($settings_list != false) {
                    $Smarty->assign('settings_list', $settings_list);
                    display('adm_settings/edit.tpl');
                } else settings_error('Setting does not exist');
            } else settings_list();
            break;
        case 'submit':
            if (filter_input(INPUT_POST, 'settings_submit')) {
                $settings_name = filter_input(INPUT_POST, 'settings_name', FILTER_SANITIZE_STRING);
                $settings_value = filter_input(INPUT_POST, 'settings_value', FILTER_SANITIZE_STRING);
                if (Settings::S()->Set($settings_name, $settings_value) == true) header('location: settings.php');
                else settings_error('Could not update setting');
            }
            break;
        case 'delete':
            if (filter_input(INPUT_GET, 'id', FILTER_VALIDATE_INT)) {
                $settings_list = Settings::S()->GetById(filter_input(INPUT_GET, 'id'));
                if ($settings_list != false) {
                    $Smarty->assign('settings_list', $settings_list);
                    display('adm_settings/delete.tpl');
                } else settings_error('Setting does not exist');
            } else settings_list();
            break;
        case 'delete_confirm':
            if (filter_input(INPUT_POST, 'settings_id', FILTER_VALIDATE_INT)) {
                if (Settings::S()->Delete(filter_input(INPUT_POST, 'settings_id')) == true) header('location: settings.php');
                else settings_error('Could not delete setting');
            } else settings_list();
            break;
        case 'list':
        default:
            settings_list();
            break;
    }
} else settings_list();