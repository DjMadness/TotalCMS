<?php
/* Smarty version 3.1.29, created on 2016-02-22 00:01:12
  from "/home/djmadness/www/vhosts/totalirc.net/subdomains/project.totalirc.net/httpdocs/templates/default/pages/settings/edit.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_56ca4fc8395318_97213693',
  'file_dependency' => 
  array (
    '42374174e45e64fda881cca6c2358f0ba65d82e9' => 
    array (
      0 => '/home/djmadness/www/vhosts/totalirc.net/subdomains/project.totalirc.net/httpdocs/templates/default/pages/settings/edit.tpl',
      1 => 1456068939,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_56ca4fc8395318_97213693 ($_smarty_tpl) {
$_smarty_tpl->ext->_inheritance->init($_smarty_tpl, false);
$_smarty_tpl->ext->_inheritance->processBlock($_smarty_tpl, 0, 'body', array (
  0 => 'block_1748701256ca4fc8389f07_76070513',
  1 => false,
  3 => 0,
  2 => 0,
));
}
/* {block 'body'}  file:default/pages/settings/edit.tpl */
function block_1748701256ca4fc8389f07_76070513($_smarty_tpl, $_blockParentStack) {
?>

    <section class='dialog'>
        <h3>Edit setting</h3>
        <p>Below you can edit the setting name and value, please note if the name is in use you will be overwriting it</p>
        <form action='?do=submit' method='POST'>
            <?php
$_from = $_smarty_tpl->tpl_vars['settings_list']->value;
if (!is_array($_from) && !is_object($_from)) {
settype($_from, 'array');
}
$__foreach_row_0_saved_item = isset($_smarty_tpl->tpl_vars['row']) ? $_smarty_tpl->tpl_vars['row'] : false;
$_smarty_tpl->tpl_vars['row'] = new Smarty_Variable();
$_smarty_tpl->tpl_vars['row']->_loop = false;
foreach ($_from as $_smarty_tpl->tpl_vars['row']->value) {
$_smarty_tpl->tpl_vars['row']->_loop = true;
$__foreach_row_0_saved_local_item = $_smarty_tpl->tpl_vars['row'];
?>
                <input type='text' name='settings_name' value='<?php echo $_smarty_tpl->tpl_vars['row']->value->settingsName;?>
' placeholder='Setting'/>
                <input type='text' name='settings_value' value='<?php echo $_smarty_tpl->tpl_vars['row']->value->settingsValue;?>
' placeholder='Value'/>
            <?php
$_smarty_tpl->tpl_vars['row'] = $__foreach_row_0_saved_local_item;
}
if ($__foreach_row_0_saved_item) {
$_smarty_tpl->tpl_vars['row'] = $__foreach_row_0_saved_item;
}
?>
            <input type='submit' name='settings_submit' value='Save' class='btn_ok'/>
            <button class='btn_cancel'><a href='settings.php'>Cancel</a></button>    
        </form>
    </section>
<?php
}
/* {/block 'body'} */
}
