{block name=body}
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
{/block}