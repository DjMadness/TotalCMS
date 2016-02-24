{block name=body}
    <section class="formular">
        <h3>Register user</h3>
        <p>you can register your user here.</p>
        <form method="POST">
            <div class="row">
                <label for="register_username">Username</label>
                <input type="text" name="register_username" placeholder="Username" value="" />
            </div>
            <div class="row">
                <label for="register_password">Password</label>
                <input type="password" name="register_password" placeholder="Password" value="" />
            </div>
            <div class="row">
                <label for="register_rpassword">Repeat password</label>
                <input type="password" name="register_rpassword" placeholder="Repeat password" value="" />
            </div>
            <div class="row">
                <label for="register_email">Email address</label>
                <input type="text" name="register_email" placeholder="Email address" value="" />
            </div>
            <div class="row">
                <label for="register_remail">Repeat email</label>
                <input type="text" name="register_remail" placeholder="Repeat email" value="" />
            </div>
            <div class="row">
                <label for="register_tos">Accept TOS ?</label>
                <input type="checkbox" name="register_tos"/>
                <a href="tos.php">Terms of service</a>
            </div>
            <input type="submit" name="register_submit" value="Register"/>
        </form>
    </section>
{/block}