<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    $query = "DELETE FROM bids WHERE task_id = '{$_POST['task_id']}'";

    $result = pg_query($conn, $query);

    if ($result){
        echo json_encode($result);
    } else {
        echo json_encode(array())
    }

?>



    