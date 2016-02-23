{block name=body}

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
                {foreach from=$settings_list item=row}
                    <tr>
                        <td>{$row->settingsName}</td>
                        <td>{$row->settingsValue}</td>
                        <td>
                            <a href='?do=edit&amp;id={$row->settingsId}'>Edit</a> 
                            <a href='?do=delete&amp;id={$row->settingsId}'>Delete</a>
                        </td>
                    </tr>
                {/foreach}
            </tbody>
        </table>
    </section>
{/block}