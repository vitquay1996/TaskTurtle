<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    // TODO: refactor this in future
    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");

    $uuid = uuid();
    $result = pg_query($conn, "INSERT INTO tasks VALUES ('{$uuid}', '{$_SESSION['login_user']}', NULL, '{$category}', '{$date}', '{$address}', '{$task_description}', {$estimated_hours}, 0, 0);");

    if ($result) {
        echo 'Successfully created task!';
        header("location: task_details.php?id=" . $uuid);
    } else {
        echo 'Some fields are not correct!';
        $error = pg_result_error($result);
        header("location: create_task.php?error={$error}");
    }

    function uuid() {
        return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
            mt_rand(0, 0xffff), mt_rand(0, 0xffff),
            mt_rand(0, 0xffff),
            mt_rand(0, 0x0fff) | 0x4000,
            mt_rand(0, 0x3fff) | 0x8000,
            mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
        );
    }
?>