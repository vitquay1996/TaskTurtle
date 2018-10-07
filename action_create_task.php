<?php
    require_once 'config.php';
    require_once 'session.php';
    extract($_POST);

    // TODO: refactor this in future
    $conn = pg_connect("host=" . DB_HOST . ", port=" . DB_PORT . ", dbname=" . DB_NAME);

    // TODO: what's the id here @Hoang
    $id = '2';
    // TODO: supposed to be DATETIME? Change SQL schematic?
    $today = date("Y-m-d"); 

    $query = "INSERT INTO tasks VALUES ('" . $id . "','" . $login_email . "', NULL,'" . $category . "','" . $today ."','" . $address . "','" . $description . "'," . $est_hours . ",0,0)";
    $result = pg_query($conn, $query);

    if ($result) {
        echo 'Successfully created task!';
        header("location: task_details.php?id=" . $id);
    } else {
        echo 'Some fields are not correct!';
        header("location: create_task.php?error=1&category=".$category."&address=".$address."&description=".$description."&est_hour=".$est_hour);
    }
?>