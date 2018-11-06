<?php

require 'session.php';
require_once 'config.php';
$conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);

extract($_POST);

if (is_null($category) && 
    is_null($date) && 
    is_null($timeStart) &&
    is_null($timeEnd) && 
    is_null($address) && 
    is_null($description) && 
    is_null($isFinished) && 
    is_null($isPaid) && 
    is_null($id)) {
    echo json_encode(array("success" => false));
} else {
    $query = "UPDATE tasks SET category = '{$category}', date = '{$date}', time_start = '{$timeStart}', time_end = '{$timeEnd}', address = '{$address}', description = '{$description}', is_finished = {$isFinished}, is_paid = {$isPaid} ";
    $query = $query . " WHERE id = '" . $id . "'";

    $result = pg_query($conn, $query);
    echo $query;
    if ($result) {
        echo json_encode(array("success" => true));
    } else {
        echo json_encode(array("success" => false));
    }
}

?>