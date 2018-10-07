<?php
    require_once 'config.php';
    session_start();
    extract($_POST);

    $conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
    $query = "SELECT * from bids WHERE tasker_email = '{$_SESSION['login_user']}'";

    $result = pg_query($conn, $query);

    if (pg_num_rows($result) != 0) {
        echo "Previous bid found";
        $query2 = "UPDATE bids SET price = '{$_POST['bid_price']}' WHERE tasker_email = '{$_SESSION['login_user']}'";
        $result2 = pg_query($conn, $query2);
    } else {
        echo "No Previous bid found";
        echo $result;
        $query2 = "INSERT INTO bids VALUES ('{$_SESSION['login_user']}', '{$_POST['id']}',  '{$_POST['bid_price']}', 0);";
        $result2 = pg_query($conn, $query2);
    }
?>