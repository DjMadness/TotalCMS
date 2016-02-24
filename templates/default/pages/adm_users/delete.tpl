{block name=body}
    <section class='dialog'>
        <h3>Are you sure</h3>
        <p>Are you sure you want to delete this user ?</p>
        <form action='?do=delete_confirm' method='POST'>
            {foreach from=$users_list item=row}
                <input type='hidden' name='users_id' value='{$row->usersId}'/>
            {/foreach}
            <input type='submit' name='users_submit' value='Yes' class='btn_ok'/>
            <button class='btn_cancel'><a href='adm_users.php'>No</a></button>    
        </form>
    </section>
{/block}