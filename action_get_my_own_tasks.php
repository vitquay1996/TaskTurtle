<?php
    require_once 'session.php';

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    $query = "SELECT t.id, t.description, t.date, t.time_start, t.time_end, count(*) as total_bidders, min(price) as min_bid from (tasks t inner join bids b on t.id = b.task_id) where t.requester_email = '{$_SESSION['login_user']}' group by t.id";

    $result = pg_query($conn, $query);
    $resultArray = pg_fetch_all($result);
    echo json_encode($resultArray);
?>