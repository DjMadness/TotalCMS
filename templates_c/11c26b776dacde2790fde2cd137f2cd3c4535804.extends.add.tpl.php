<?php /* Smarty version Smarty-3.1.16, created on 2016-02-21 16:29:16
         compiled from "./templates/default/pages/settings/add.tpl" */ ?>
<?php /*%%SmartyHeaderCode:130138468356c9e5dc15e335-86921537%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3c1162edbbd1e2936f0ff40922a1f96e31570b79' => 
    array (
      0 => './templates/default/pages/settings/add.tpl',
      1 => 1456068942,
      2 => 'file',
    ),
    'e3c39482511daa53023e3a1e583ec17e4446186b' => 
    array (
      0 => './templates/default/layout/layout.tpl',
      1 => 1456069718,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '130138468356c9e5dc15e335-86921537',
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
  'unifunc' => 'content_56c9e5dc185745_57935851',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56c9e5dc185745_57935851')) {function content_56c9e5dc185745_57935851($_smarty_tpl) {?><!DOCTYPE html>
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
        <h3>Add setting</h3>
        <p>Below you can add a setting name and value, please note if the name is in use you will be overwriting it</p>
        <form action='?do=submit' method='POST'>
            <input type='text' name='settings_name' placeholder='Setting'/>
            <input type='text' name='settings_value' placeholder='Value'/>
            <input type='submit' name='settings_submit' value='Add' class='btn_ok'/>
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
