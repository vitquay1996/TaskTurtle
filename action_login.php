<?php
    require_once 'config.php';
    session_start();
    extract($_POST);
    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    
    $query = "SELECT salted_password FROM users WHERE email='" . $email . "'";
    $result = pg_query($conn, $query);
    $row = pg_fetch_row($result);
    if (password_verify($password, $row[0])) {
        echo 'Password is valid!';
        $_SESSION['login_user'] = $email;
        header("location: index.php");
    } else {
        echo 'Invalid password or email';

        header("location: login.php?wrongpassword=1");
    }
?>