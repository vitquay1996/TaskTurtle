<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);
    
    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    $query = "SELECT b.* FROM bids b, users u WHERE b.task_id ='{$_POST['task_id']}' and u.email ='{$_SESSION['login_user']}' and u.email = b.tasker_email";

    $result = pg_query($conn, $query);
    $resultArray = pg_fetch_all($result);

    if ($result){
        echo json_encode($result);
    } else {
        echo json_encode(array())
    }
?>