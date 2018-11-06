<?php
    header('Access-Control-Allow-Origin: http://localhost:3000');
    header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
    header('Access-Control-Allow-Credentials: true');
    require_once 'config.php';
    session_start();
    extract($_POST);
    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    
    $query = "SELECT salted_password FROM users WHERE email='" . $email . "'";
    $result = pg_query($conn, $query);
    $row = pg_fetch_row($result);
    if (password_verify($password, $row[0])) {
        $_SESSION['login_user'] = $email;
        $_SESSION['token'] = uuid();
        //setcookie('PHPSESSID', session_id(), time()+3600, "/", "", false, false);
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }

    function uuid() {
        return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            mt_rand(0, 0xffff), mt_rand(0, 0xffff),
            mt_rand(0, 0xffff),
            mt_rand(0, 0x0fff) | 0x4000,
            mt_rand(0, 0x3fff) | 0x8000,
            mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }
?>