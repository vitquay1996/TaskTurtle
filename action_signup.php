<?php
    require_once 'config.php';
    extract($_POST);
    $conn = pg_connect("host=" . DB_HOST . ", port=" . DB_PORT . ", dbname=" . DB_NAME);
    
    $password = password_hash($password, PASSWORD_DEFAULT);
    $query = "INSERT INTO users VALUES ('" . $email . "','" . $fullname . "','" . $password . "', NULL,'" . $address . "','" . $phone . "','" . $introduction . "')";
    echo $query;
    $result = pg_query($conn, $query);
    if ($result) {
        echo "Success";
    }
?>