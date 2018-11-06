<?php
    header('Access-Control-Allow-Origin: http://localhost:3000');
    header('Access-Control-Allow-Methods: GET, POST, PATCH, PUT, DELETE, OPTIONS');
    header('Access-Control-Allow-Headers: Origin, Content-Type, X-Auth-Token');
    header('Access-Control-Allow-Credentials: true');
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    // TODO: refactor this in future
    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");

    $uuid = uuid();
    $result = pg_query($conn, "INSERT INTO tasks VALUES ('{$uuid}', '{$_SESSION['login_user']}', NULL, '{$category}', '{$date}', '{$timestart}', '{$timeend}', '{$address}', '{$description}', 0, 0);");

    if ($result) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false, "query" => "INSERT INTO tasks VALUES ('{$uuid}', '{$_SESSION['login_user']}', NULL, NULL, '{$category}', '{$date}', '{$timestart}', '{$timeend}', '{$address}', '{$description}', 0, 0);"));
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