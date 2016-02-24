{block name=body}
    <section class='dialog'>
        <h3>Are you sure</h3>
        <p>Are you sure you want to delete this setting ?</p>
        <form action='?do=delete_confirm' method='POST'>
            {foreach from=$settings_list item=row}
                <input type='hidden' name='settings_id' value='{$row->settingsId}'/>
            {/foreach}
            <input type='submit' name='settings_submit' value='Yes' class='btn_ok'/>
            <button class='btn_cancel'><a href='adm_settings.php'>No</a></button>    
        </form>
    </section>
{/block}