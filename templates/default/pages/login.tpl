{block name=body}
    <section class="dialog">
        <h3>Login</h3>
        <p>You can login with the form below</p>
        <form method="POST">
            <input type="text" name="login_username" placeholder="Username"/>
            <input type="password" name="login_password" placeholder="Password"/>
            <input type="submit" name="login_submit" value="Login">
            <a href="resetpass.php">Reset password</a>
            <a href="register.php">Register</a>
        </form>
    </section>
{/block}