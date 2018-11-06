<?php
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    $query = "SELECT b.*, u.full_name as bidder_name, u.rating_tasker as bidder_rating FROM bids b, users u WHERE b.task_id = '{$taskId}' and b.tasker_email = u.email";
    
    $result = pg_query($conn, $query);
    $resultArray = pg_fetch_all($result);
    echo json_encode($resultArray);
?>