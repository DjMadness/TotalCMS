{block name=body}
    <section class='dialog'>
        <h3>Edit user</h3>
        <p>Below you can edit the user, along with all metadata the user has set, this also includes adding and deleting metadata</p>
        <form action='?do=submit' method='POST'>
            {foreach from=$users_list item=row}
                <div class="row">
                    <label for="form_username">Username</label>
                    <input type="text" name="form_username" placeholder="Username" value="{$row->usersUsername}" />
                </div>
                {foreach from=$row->metadata item=metadata key=key}
                    {if $key == 'email'}
                        <div class="row">
                            <label for="form_email">Email</label>
                            <input type="email" name="form_email" placeholder="Email" value="{$metadata}" />
                        </div>
                    {else}
                        <div class="row">
                            <label for="form_{$key}">{$key}</label>
                            <input type="text" name="form_email" placeholder="{$key}" value="{$metadata}" />
                        </div>
                    {/if}
                {/foreach}
                {foreach from=$row->profile item=profile key=key}
                    {if $key != 'profiletext'}
                        <div class="row">
                            <label for="form_{$key}">{$key}</label>
                            <input type="text" name="form_email" placeholder="Email" value="{$profile}" />
                        </div>
                    {else}
                        <div class="row">
                            <label for="form_profiletext">Profile text</label>
                            <textarea name='form_profiletext'>{$profile}</textarea>
                        </div>
                    {/if}
                {/foreach}
            {/foreach}
            <input type='submit' name='settings_submit' value='Save' class='btn_ok'/>
            <button class='btn_cancel'><a href='settings.php'>Cancel</a></button>    
        </form>
    </section>
{/block}