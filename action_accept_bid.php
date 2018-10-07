<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
    $query = "UPDATE tasks SET tasker_email = '{$tasker_email}' WHERE id = '{$task_id}';";

    $result = pg_query($conn, $query);

    if ($result) {
        $query = "UPDATE bids SET is_accepted = 1 WHERE tasker_email = '{$tasker_email}';";

        $result = pg_query($conn, $query);

        if ($result) {
            echo "Success";
        } else {
            echo "Error";
        }
    } else {
        echo "Error";
    }
?>