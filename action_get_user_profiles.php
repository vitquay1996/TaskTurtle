<?php
    require_once 'config.php';
    require_once 'session.php';

    $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");

    $query = "SELECT * FROM users WHERE email='" . $_SESSION['login_user'] . "'";
    $result = pg_query($conn, $query);

    if ($result) {
        $row = pg_fetch_assoc($result);
        echo json_encode(array(
            "isLoggedIn" => true,
            "email" => $_SESSION['login_user'],
            "fullName" => $row["full_name"],
            "photoPath" => $row["photo_file_path"],
            "phone" => $row["phone"],
            "address" => $row["address"],
            "introduction" => $row["introduction"],
            "ratingTasker" => $row["rating_tasker"],
            "ratingRequester" => $row["rating_requester"]
        ));
    } else {
        json_encode(array(
           "isLoggedIn" => false
        ));
    }

?>