<?php
    require_once 'config.php';
    session_start();
    extract($_POST);

    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    $query = "SELECT * from bids WHERE tasker_email = '{$_SESSION['login_user']}' AND task_id = '{$_POST['taskId']}'";

    $result = pg_query($conn, $query);

    if (pg_num_rows($result) != 0) {
        $query2 = "UPDATE bids SET price = '{$_POST['bidPrice']}' WHERE tasker_email = '{$_SESSION['login_user']}' AND task_id = '{$_POST['taskId']}'";
        $result2 = pg_query($conn, $query2);
        if ($result2) {
            echo json_encode(array(
                "success" => true
            ));
        } else {
            echo json_encode(array(
                "success" => false
            ));
        }
    } else {
        $query2 = "INSERT INTO bids VALUES ('{$_SESSION['login_user']}', '{$_POST['taskId']}',  '{$_POST['bidPrice']}', 0);";
        $result2 = pg_query($conn, $query2);
        if ($result2) {
            echo json_encode(array(
                "success" => true
            ));
        } else {
            echo json_encode(array(
                "success" => false
            ));
        }
    }
?>