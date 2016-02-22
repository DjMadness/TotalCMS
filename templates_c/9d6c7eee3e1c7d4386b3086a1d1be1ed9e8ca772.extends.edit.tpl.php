<?php /* Smarty version Smarty-3.1.16, created on 2016-02-21 16:30:05
         compiled from "./templates/default/pages/settings/edit.tpl" */ ?>
<?php /*%%SmartyHeaderCode:181001239056c9e60df34046-26318259%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '7684ea4617542f2cdb06bb0f2633171d14f2176f' => 
    array (
      0 => './templates/default/pages/settings/edit.tpl',
      1 => 1456068939,
      2 => 'file',
    ),
    'e3c39482511daa53023e3a1e583ec17e4446186b' => 
    array (
      0 => './templates/default/layout/layout.tpl',
      1 => 1456069718,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '181001239056c9e60df34046-26318259',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'website_title' => 0,
    'website_description' => 0,
    'website_author' => 0,
    'website_keywords' => 0,
    'website_footer' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.16',
  'unifunc' => 'content_56c9e60e01d667_36481641',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56c9e60e01d667_36481641')) {function content_56c9e60e01d667_36481641($_smarty_tpl) {?><!DOCTYPE html>
<html>
    <head>
        <title><?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_title']->value)===null||$tmp==='' ? 'No title' : $tmp);?>
</title>
        <meta charset='utf-8'/>
        <meta content="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_description']->value)===null||$tmp==='' ? 'No description' : $tmp);?>
" name="description"/>
        <meta content="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_author']->value)===null||$tmp==='' ? 'No author' : $tmp);?>
" name="author"/>
        <meta content="<?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_keywords']->value)===null||$tmp==='' ? 'No keywords' : $tmp);?>
" name="keywords"/>
        <link href='templates/default/media/css/default.css' type='text/css' rel='stylesheet'/>
    </head>
    <body>
        <div id='wrapper'>
            <header id='header'>

            </header>
            <div id='content'>
                <nav id='nav'>

                </nav>
                <div id='body'>
    <section class='dialog'>
        <h3>Edit setting</h3>
        <p>Below you can edit the setting name and value, please note if the name is in use you will be overwriting it</p>
        <form action='?do=submit' method='POST'>
            <?php  $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['settings_list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['row']->key => $_smarty_tpl->tpl_vars['row']->value) {
$_smarty_tpl->tpl_vars['row']->_loop = true;
?>
                <input type='text' name='settings_name' value='<?php echo $_smarty_tpl->tpl_vars['row']->value->settingsName;?>
' placeholder='Setting'/>
                <input type='text' name='settings_value' value='<?php echo $_smarty_tpl->tpl_vars['row']->value->settingsValue;?>
' placeholder='Value'/>
            <?php } ?>
            <input type='submit' name='settings_submit' value='Save' class='btn_ok'/>
            <button class='btn_cancel'><a href='settings.php'>Cancel</a></button>    
        </form>
    </section>
</div>
            </div>
            <footer id='footer'><?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_footer']->value)===null||$tmp==='' ? 'No footer' : $tmp);?>
</footer>
        </div>
    </body>
</html><?php }} ?>
