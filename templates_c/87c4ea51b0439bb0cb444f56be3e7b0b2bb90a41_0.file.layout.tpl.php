<?php
/* Smarty version 3.1.29, created on 2016-02-22 00:49:27
  from "/home/djmadness/www/vhosts/totalirc.net/subdomains/project.totalirc.net/httpdocs/templates/default/layout/layout.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_56ca5b171f8e28_16277497',
  'file_dependency' => 
  array (
    '87c4ea51b0439bb0cb444f56be3e7b0b2bb90a41' => 
    array (
      0 => '/home/djmadness/www/vhosts/totalirc.net/subdomains/project.totalirc.net/httpdocs/templates/default/layout/layout.tpl',
      1 => 1456074507,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_56ca5b171f8e28_16277497 ($_smarty_tpl) {
$_smarty_tpl->ext->_inheritance->init($_smarty_tpl, false);
?>
<!DOCTYPE html>
<html>
    <head>
        <title><?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_title']->value)===null||$tmp==='' ? 'No title' : $tmp);?>
</title>
        <meta charset='<?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_charset']->value)===null||$tmp==='' ? 'utf-8' : $tmp);?>
'/>
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
                <div id='body'><?php 
$_smarty_tpl->ext->_inheritance->processBlock($_smarty_tpl, 0, 'body', array (
  0 => 'block_87820679856ca5b171f41c5_87314662',
  1 => false,
  3 => 0,
  2 => 0,
));
?>
</div>
            </div>
            <footer id='footer'><?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_footer']->value)===null||$tmp==='' ? 'No footer' : $tmp);?>
</footer>
        </div>
    </body>
</html><?php }
/* {block 'body'}  file:default/layout/layout.tpl */
function block_87820679856ca5b171f41c5_87314662($_smarty_tpl, $_blockParentStack) {
?>
No body loaded<?php
}
/* {/block 'body'} */
}
