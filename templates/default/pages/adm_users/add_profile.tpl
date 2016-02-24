{block name=body}
    <section class='dialog'>
        <h3>Add user profile setting</h3>
        <p>Below you can add a user profile setting</p>
        <form action='?do=add_profile_submit' method='POST'>
            <div class="row">
                <label for="form_setting">Setting</label>
                <input type="email" name="form_setting" placeholder="Setting" value="" />
            </div>
            <div class="row">
                <label for="form_value">Value</label>
                <input type="email" name="form_value" placeholder="Value" value="" />
            </div>
            <input type='submit' name='users_submit' value='Save' class='btn_ok'/>
            <button class='btn_cancel'><a href='adm_users.php'>Cancel</a></button>  
        </form>
    </section>
{/block}