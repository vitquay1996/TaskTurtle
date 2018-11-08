<?php

require 'session.php';
require_once 'config.php';
$conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);

extract($_POST);

if (is_null($address) && 
    is_null($fullName) && 
    is_null($phone) &&
    is_null($introduction) && 
    is_null($password)) {
    echo json_encode(array("success" => false));
} else {
    $query = "UPDATE users SET address = '{$address}', full_name = '{$fullName}', phone = '{$phone}', introduction = '{$introduction}' ";
    if (!empty($password)) {
        $password = password_hash($password, PASSWORD_DEFAULT);
        $query = $query . ", salted_password = '{$password}' ";
    }
    $query = $query . " WHERE email = '" . $_SESSION['login_user'] . "'";

    $result = pg_query($conn, $query);
    // echo $query;
    if ($result) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
}

?>