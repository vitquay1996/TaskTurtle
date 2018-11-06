<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    $query = "SELECT * FROM task_category";

    $result = pg_query($conn, $query);
    $resultArray = pg_fetch_all($result);
    echo json_encode($resultArray);

?>