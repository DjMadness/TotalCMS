<?php
/* Smarty version 3.1.29, created on 2016-02-21 22:50:05
  from "/home/djmadness/www/vhosts/totalirc.net/subdomains/project.totalirc.net/httpdocs/templates/default/pages/settings/add.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_56ca3f1dd46608_50928286',
  'file_dependency' => 
  array (
    '88bf1968bd08420a76dc762aad03ffeaae1db565' => 
    array (
      0 => '/home/djmadness/www/vhosts/totalirc.net/subdomains/project.totalirc.net/httpdocs/templates/default/pages/settings/add.tpl',
      1 => 1456068942,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_56ca3f1dd46608_50928286 ($_smarty_tpl) {
$_smarty_tpl->ext->_inheritance->init($_smarty_tpl, false);
$_smarty_tpl->ext->_inheritance->processBlock($_smarty_tpl, 0, 'body', array (
  0 => 'block_147853877956ca3f1dd3fc01_09550666',
  1 => false,
  3 => 0,
  2 => 0,
));
}
/* {block 'body'}  file:default/pages/settings/add.tpl */
function block_147853877956ca3f1dd3fc01_09550666($_smarty_tpl, $_blockParentStack) {
?>

    <section class='dialog'>
        <h3>Add setting</h3>
        <p>Below you can add a setting name and value, please note if the name is in use you will be overwriting it</p>
        <form action='?do=submit' method='POST'>
            <input type='text' name='settings_name' placeholder='Setting'/>
            <input type='text' name='settings_value' placeholder='Value'/>
            <input type='submit' name='settings_submit' value='Add' class='btn_ok'/>
            <button class='btn_cancel'><a href='settings.php'>Cancel</a></button>    
        </form>
    </section>
<?php
}
/* {/block 'body'} */
}
