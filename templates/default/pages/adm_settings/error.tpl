{block name=body}
    <div class='dialog'>
        <h3>Error</h3>
        <p>{$settings_error|default:'Setting does not exist'}</p>
        <button><a href='settings.php'>Back</a></button>
    </div>
{/block}