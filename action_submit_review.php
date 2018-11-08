<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    $query = "INSERT INTO reviews VALUES ('{$task_id}', '{$reviewer_email}', '{$receiver_email}', '{$receiver_role}', '{$rating}','{$review_content}' )";

    $result = pg_query($conn, $query);

    if ($result){
        echo json_encode($result);
    } else {
        echo json_encode(array())
    }
?>