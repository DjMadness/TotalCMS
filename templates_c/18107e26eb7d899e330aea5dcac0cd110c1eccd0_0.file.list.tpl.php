<?php
/* Smarty version 3.1.29, created on 2016-02-22 00:49:27
  from "/home/djmadness/www/vhosts/totalirc.net/subdomains/project.totalirc.net/httpdocs/templates/default/pages/settings/list.tpl" */

if ($_smarty_tpl->smarty->ext->_validateCompiled->decodeProperties($_smarty_tpl, array (
  'has_nocache_code' => false,
  'version' => '3.1.29',
  'unifunc' => 'content_56ca5b171e11a2_25659025',
  'file_dependency' => 
  array (
    '18107e26eb7d899e330aea5dcac0cd110c1eccd0' => 
    array (
      0 => '/home/djmadness/www/vhosts/totalirc.net/subdomains/project.totalirc.net/httpdocs/templates/default/pages/settings/list.tpl',
      1 => 1456068942,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_56ca5b171e11a2_25659025 ($_smarty_tpl) {
$_smarty_tpl->ext->_inheritance->init($_smarty_tpl, false);
$_smarty_tpl->ext->_inheritance->processBlock($_smarty_tpl, 0, 'body', array (
  0 => 'block_211682992656ca5b171c7c26_19196383',
  1 => false,
  3 => 0,
  2 => 0,
));
}
/* {block 'body'}  file:default/pages/settings/list.tpl */
function block_211682992656ca5b171c7c26_19196383($_smarty_tpl, $_blockParentStack) {
?>


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
                <?php
$_smarty_tpl->tpl_vars['row'] = $__foreach_row_0_saved_local_item;
}
if ($__foreach_row_0_saved_item) {
$_smarty_tpl->tpl_vars['row'] = $__foreach_row_0_saved_item;
}
?>
            </tbody>
        </table>
    </section>
<?php
}
/* {/block 'body'} */
}
