<?php
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    $query = "SELECT * FROM (bids b inner join tasks t on b.task_id = t.id)  WHERE b.tasker_email = '{$_SESSION['login_user']}'";
    
    $result = pg_query($conn, $query);
    $resultArray = pg_fetch_all($result);
    if ($resultArray) {
        echo json_encode($resultArray);
    } else {
        echo json_encode(array());
    }
?>