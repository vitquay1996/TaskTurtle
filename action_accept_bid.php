<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    $query = "UPDATE tasks SET tasker_email = '{$taskerEmail}' WHERE id = '{$taskId}';";

    $result = pg_query($conn, $query);

    if ($result) {
        $query = "UPDATE bids SET is_accepted = 1 WHERE tasker_email = '{$taskerEmail}';";

        $result = pg_query($conn, $query);

        if ($result) {
            echo json_encode(array(
                "success" => true
            ));
        } else {
            echo json_encode(array(
                "success" => false
            ));
        }
    } else {
        echo json_encode(array(
            "success" => false
        ));
    }
?>