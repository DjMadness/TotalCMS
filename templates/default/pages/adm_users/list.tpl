{block name=body}
    <section class="dialog">
        <h3>Users</h3>
        <p>Below is the list of the users on the website</p>
        <table class='table_list'>
            <thead>
                <tr>
                    <th>id</th>
                    <th>username</th>
                    <th>registration date</th>
                    <th>Email</th>
                    <td></td>
                </tr>
            </thead>
            <tbody>
                {foreach from=$users_list item=row}
                    <tr>
                        <td>{$row->usersId}</td>
                        <td>{$row->usersUsername}</td>
                        <td>{$row->usersDate}</td>
                            {foreach from=$row->metadata item=metadata key=key}
                                {if $key == 'email'}
                                    <td>{$metadata|lower}</td>
                                {/if}
                            {/foreach}
                        <td>
                            <a href='?do=edit&amp;id={$row->usersId}'>Edit</a> 
                            <a href='?do=delete&amp;id={$row->usersId}'>Delete</a>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </section>
{/block}