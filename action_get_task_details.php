<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    $query = "SELECT * FROM tasks WHERE id = '{$taskId}'";

    $result = pg_query($conn, $query);

    if ($result) {
        $row = pg_fetch_assoc($result);
        echo json_encode(array(
            "success" => true,
            "requesterEmail" => $row['requester_email'],
            "taskerEmail" => $row['tasker_email'],
            "category" => $row['category'],
            "customCategory" => $row['custom_category'],
            "date" => $row['date'],
            "timeStart" => $row['time_start'],
            "timeEnd" => $row['time_end'],
            "address" => $row['address'],
            "description" => $row['description']
        ));
    } else {
        echo json_encode(array(
            "success" => false
        ));
    }
?>