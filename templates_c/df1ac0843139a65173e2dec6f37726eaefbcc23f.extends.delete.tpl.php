<?php /* Smarty version Smarty-3.1.16, created on 2016-02-21 16:29:50
         compiled from "./templates/default/pages/settings/delete.tpl" */ ?>
<?php /*%%SmartyHeaderCode:128937830956c9e5febb5840-27356305%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '040f98f08a7941bdb896b6a98a0c5a4a5dac970a' => 
    array (
      0 => './templates/default/pages/settings/delete.tpl',
      1 => 1456068940,
      2 => 'file',
    ),
    'e3c39482511daa53023e3a1e583ec17e4446186b' => 
    array (
      0 => './templates/default/layout/layout.tpl',
      1 => 1456069718,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '128937830956c9e5febb5840-27356305',
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
  'unifunc' => 'content_56c9e5febe75f5_12991481',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56c9e5febe75f5_12991481')) {function content_56c9e5febe75f5_12991481($_smarty_tpl) {?><!DOCTYPE html>
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
        <h3>Are you sure</h3>
        <p>Are you sure you want to delete this setting ?</p>
        <form action='?do=delete_confirm' method='POST'>
            <?php  $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['settings_list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['row']->key => $_smarty_tpl->tpl_vars['row']->value) {
$_smarty_tpl->tpl_vars['row']->_loop = true;
?>
                <input type='hidden' name='settings_id' value='<?php echo $_smarty_tpl->tpl_vars['row']->value->settingsId;?>
'/>
            <?php } ?>
            <input type='submit' name='settings_submit' value='Yes' class='btn_ok'/>
            <button class='btn_cancel'><a href='settings.php'>No</a></button>    
        </form>
    </section>
</div>
            </div>
            <footer id='footer'><?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_footer']->value)===null||$tmp==='' ? 'No footer' : $tmp);?>
</footer>
        </div>
    </body>
</html><?php }} ?>
