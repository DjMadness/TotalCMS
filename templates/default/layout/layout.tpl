<!DOCTYPE html>
<html>
    <head>
        <title>{$website_title|default:'No title'}</title>
        <meta charset='{$website_charset|default:'utf-8'}'/>
        <meta content="{$website_description|default:'No description'}" name="description"/>
        <meta content="{$website_author|default:'No author'}" name="author"/>
        <meta content="{$website_keywords|default:'No keywords'}" name="keywords"/>
        <link href='templates/default/media/css/default.css' type='text/css' rel='stylesheet'/>
    </head>
    <body>
        <div id='wrapper'>
            <header id='header'>
                
            </header>
            <div id='content'>
                <nav id='nav'>

                </nav>
                <div id='body'>{block name=body}No body loaded{/block}</div>
            </div>
            <footer id='footer'>{$website_footer|default:'No footer'}</footer>
        </div>
    </body>
</html>