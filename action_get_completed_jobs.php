<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    $query = "SELECT t.id as task_id, t.description as task_description, t.date, t.time_start, t.time_end, u1.email as requester_email, u1.full_name as requester_name, (case when exists (Select 1 from reviews r where r.reviewer_email = '{$_SESSION['login_user']}' and r.task_id = t.id and r.receiver_email = u1.email) then true else false end) as if_reviewed FROM tasks t, users u1 WHERE u1.email = t.requester_email and t.tasker_email = '{$_SESSION['login_user']}' and t.is_finished = 1;";
    $result = pg_query($conn, $query);
    $resultArray = pg_fetch_all($result);

    if ($result){
        echo json_encode($resultArray);
    } else {
        echo json_encode(array());
    }
?>