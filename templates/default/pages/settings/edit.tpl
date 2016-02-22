{block name=body}
    <section class='dialog'>
        <h3>Edit setting</h3>
        <p>Below you can edit the setting name and value, please note if the name is in use you will be overwriting it</p>
        <form action='?do=submit' method='POST'>
            {foreach from=$settings_list item=row}
                <input type='text' name='settings_name' value='{$row->settingsName}' placeholder='Setting'/>
                <input type='text' name='settings_value' value='{$row->settingsValue}' placeholder='Value'/>
            {/foreach}
            <input type='submit' name='settings_submit' value='Save' class='btn_ok'/>
            <button class='btn_cancel'><a href='settings.php'>Cancel</a></button>    
        </form>
    </section>
{/block}