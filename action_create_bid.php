<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    if (is_null($taskId) && 
        is_null($price)) {
        echo json_encode(array("success" => false));
    } else {
        $result = pg_query($conn, "INSERT INTO bids VALUES ('{$_SESSION['login_user']}', '{$taskId}', {$price});");
        if ($result) {
            echo json_encode(array("success" => true));
        } else {
            echo json_encode(array("success" => false, "query" => "INSERT INTO bids VALUES ('vitquay1996@gmail.com', '{$taskId}', {$price})"));
        }
    }

?>