<?php

/*
 * Mixed functions needed for different aspects, also in order to make the code have less duplicated.
 * This code may be removed later on and put into different sections, but for now this is the place it belongs.
 */
function display($page, $layout = 'layout.tpl') {
    global $Smarty;
    global $WS;
    $Smarty->display('extends:' . $WS['theme_selected'] . "/layout/" . $layout . "|" . $WS['theme_selected'] . "/pages/" . $page . "");
}
function getsettings() {
    global $WS;
    global $Smarty;
    foreach (Settings::S()->ListSettings() as $row) {
        $WS[$row->settingsName] = $row->settingsValue;
        $Smarty->assign($row->settingsName, $row->settingsValue);
    }
}
