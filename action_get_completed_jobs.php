<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    $query = "SELECT t.id, t.description, t.date, t.time_start, t.time_end, u1.email, u1.full_name FROM tasks t, users u1, users u2 WHERE u1.email = t.requester_email and u2.email = '{$_SESSION['login_user']}' and t.is_finished = 1";

    $result = pg_query($conn, $query);

    if ($result){
        echo json_encode($result);
    } else {
        echo json_encode(array());
    }

?>