<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    $query = "UPDATE tasks SET tasker_email = '{$tasker_email}' WHERE id = '{$task_id}';";

    $result = pg_query($conn, $query);
    
    if($result){
    $query2 = "UPDATE bids SET is_accepted = 0 WHERE tasker_email = '{$_POST['tasker_email']}'";
    $result2 = pg_query($conn, $query2);
         
    if ($result2){
        echo json_encode($result);
    } else {
        echo json_encode(array());
        }
    } else {
        echo json_encode(array());
    }
?>