<?php /* Smarty version Smarty-3.1.16, created on 2016-02-21 15:35:51
         compiled from "./templates/default/pages/index.tpl" */ ?>
<?php /*%%SmartyHeaderCode:126315377856c9d957997e29-49155165%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a248b30b80874cc306b9e3866dc1db56224354f9' => 
    array (
      0 => './templates/default/pages/index.tpl',
      1 => 1456068935,
      2 => 'file',
    ),
    'e3c39482511daa53023e3a1e583ec17e4446186b' => 
    array (
      0 => './templates/default/layout/layout.tpl',
      1 => 1456068932,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '126315377856c9d957997e29-49155165',
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
  'unifunc' => 'content_56c9d957a19a61_69566382',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56c9d957a19a61_69566382')) {function content_56c9d957a19a61_69566382($_smarty_tpl) {?><!DOCTYPE html>
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
    
</div>
            </div>
            <footer id='footer'><?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_footer']->value)===null||$tmp==='' ? 'No footer' : $tmp);?>
</footer>
        </div>
    </body>
</html><?php }} ?>
