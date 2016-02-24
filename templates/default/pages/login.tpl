{block name=body}
    <section class="center-dialog">
        <h3>Login</h3>
        <p>You can login with the form below</p>
        {if isset($login_error)}<p class="error">{$login_error}</p>{/if}
        <form method="POST">
            <input type="text" name="login_username" placeholder="Username"/>
            <input type="password" name="login_password" placeholder="Password"/>
            <input type="submit" name="login_submit" value="Login">
            <a href="resetpass.php">Reset password</a>
            <a href="register.php">Register</a>
        </form>
    </section>
{/block}