<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    $query = "select r.*, u.full_name as reviewer_name,  t.description as task_description, t.date, t.time_start, t.time_end from reviews r, tasks t, users u where r.receiver_email = '{$_SESSION['login_user']}' and r.receiver_role = '{$myRole}' and t.id = r.task_id and u.email = r.reviewer_email";

    $result = pg_query($conn, $query);
    $resultArray = pg_fetch_all($result);

    if ($result){
        echo json_encode($resultArray);
    } else {
        echo json_encode(array());
    }
?>