<html>
<body>

<h2>Log in</h2>

<form action="./action_login.php" method="post" accept-charset="UTF-8">
    <?php
        if ($_GET['wrongpassword'] == 1) {
            echo '<p style="color:red;">Wrong email or password. Try Again!</p>';
        }
    ?>
    Email:<br>
    <input type="text" name="email" size="35">
    <br>
    Password:<br>
    <input type="password" name="password" size="35">
    <br><br>
    <input type="submit" value="Submit" size="35">
</form> 

</body>
</html>