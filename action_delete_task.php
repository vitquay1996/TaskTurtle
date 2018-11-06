<?php
require 'session.php';
require_once 'config.php';
$conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);

extract($_POST);

if (is_null($id)) {
    echo json_encode(array("success" => false));
} else {
    $query = "DELETE from tasks WHERE id = '{$id}'";

    $result = pg_query($conn, $query);
    // echo $query;
    if ($result) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
}

?>