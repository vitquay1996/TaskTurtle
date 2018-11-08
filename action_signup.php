<?php
    require_once 'config.php';
    header('Access-Control-Allow-Origin: http://localhost:3000');
    header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
    header('Access-Control-Allow-Credentials: true');

    session_start();
    extract($_POST);
    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);

    $password = password_hash($password, PASSWORD_DEFAULT);
    $query = "INSERT INTO users VALUES ('{$email}','{$fullname}','{$password}', NULL,'{$address}','{$phone}','{$introduction}', FALSE, NULL, NULL)";
    $result = pg_query($conn, $query);
    if ($result) {
        $_SESSION['login_user'] = $email;
        $_SESSION['token'] = uuid();
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