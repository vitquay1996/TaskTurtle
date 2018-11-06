<?php
    header('Access-Control-Allow-Origin: http://localhost:3000');
    header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
    header('Access-Control-Allow-Credentials: true');
    include('config.php');
    $conn = pg_connect("host=" . DB_HOST . ", port=" . DB_PORT . ", dbname=" . DB_NAME);
    session_start();

    $user_check = $_SESSION['login_user'];
    $query = "SELECT email FROM users WHERE email='" . $user_check . "'";
    $result = pg_query($conn, $query);
    $row = pg_fetch_row($result);

    $login_email = $row[0];

    if (!isset($_SESSION['login_user'])) {
        echo json_encode(array(
            "isLoggedIn" => false
        ));
        die();
    }
?>