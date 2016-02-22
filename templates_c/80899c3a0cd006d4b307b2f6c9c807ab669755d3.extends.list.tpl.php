<?php /* Smarty version Smarty-3.1.16, created on 2016-02-21 16:31:37
         compiled from "./templates/default/pages/settings/list.tpl" */ ?>
<?php /*%%SmartyHeaderCode:57520534756c9e66934c1d2-75800489%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '2d1656aa00965db75f95953083354d2aca0597a3' => 
    array (
      0 => './templates/default/pages/settings/list.tpl',
      1 => 1456068942,
      2 => 'file',
    ),
    'e3c39482511daa53023e3a1e583ec17e4446186b' => 
    array (
      0 => './templates/default/layout/layout.tpl',
      1 => 1456072256,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '57520534756c9e66934c1d2-75800489',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'website_title' => 0,
    'website_charset' => 0,
    'website_description' => 0,
    'website_author' => 0,
    'website_keywords' => 0,
    'website_footer' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.16',
  'unifunc' => 'content_56c9e669386228_87888502',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_56c9e669386228_87888502')) {function content_56c9e669386228_87888502($_smarty_tpl) {?><!DOCTYPE html>
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
                <div id='body'>

    <section class="dialog">
        <h3>Settings</h3>
        <p>Below is the list of settings used by this website</p>
        <button><a href='settings.php?do=add'>Add setting</a></button>
        <table class='table_list'>
            <thead>
                <tr>
                    <th>Setting</th>
                    <th>Value</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <?php  $_smarty_tpl->tpl_vars['row'] = new Smarty_Variable; $_smarty_tpl->tpl_vars['row']->_loop = false;
 $_from = $_smarty_tpl->tpl_vars['settings_list']->value; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array');}
foreach ($_from as $_smarty_tpl->tpl_vars['row']->key => $_smarty_tpl->tpl_vars['row']->value) {
$_smarty_tpl->tpl_vars['row']->_loop = true;
?>
                    <tr>
                        <td><?php echo $_smarty_tpl->tpl_vars['row']->value->settingsName;?>
</td>
                        <td><?php echo $_smarty_tpl->tpl_vars['row']->value->settingsValue;?>
</td>
                        <td>
                            <a href='?do=edit&amp;id=<?php echo $_smarty_tpl->tpl_vars['row']->value->settingsId;?>
'>Edit</a> 
                            <a href='?do=delete&amp;id=<?php echo $_smarty_tpl->tpl_vars['row']->value->settingsId;?>
'>Delete</a>
                        </td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
    </section>
</div>
            </div>
            <footer id='footer'><?php echo (($tmp = @$_smarty_tpl->tpl_vars['website_footer']->value)===null||$tmp==='' ? 'No footer' : $tmp);?>
</footer>
        </div>
    </body>
</html><?php }} ?>
