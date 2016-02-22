<?php

include('include/smarty/libs/Smarty.class.php');
include('include/class/d.class.php');
include('include/class/validate.class.php');
include('include/config/database.config.php');
include('include/class/database.class.php');
include('include/class/user.class.php');
include('include/class/settings.class.php');
include('include/functions.php');
$Smarty = new Smarty();
$Smarty->force_compile = true;
$WS = array();
getsettings();

