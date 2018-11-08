<?php
// require 'session.php';
require_once 'config.php';
$conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);

extract($_POST);

if (is_null($category) && 
    is_null($date) && 
    is_null($timeStart) && 
    is_null($timeEnd) && 
    is_null($keyword) && 
    is_null($ifWorkedWithBefore)) {
    $query = "SELECT * FROM tasks WHERE is_finished = 0 ";
} else {
    $query = "SELECT * FROM tasks WHERE is_finished = 0 and ";
    if ($category) {
        $query = $query . "category = '{$category}' AND ";
    } 
    if ($date) {
        $query = $query . "date = '{$date}' AND ";
    }
    if ($timeStart) {
        $query = $query . "time_start = '{$timeStart}' AND ";
    } 
    if ($timeEnd) {
        $query = $query . "time_end = '{$timeEnd}' AND ";
    }
    if ($ifWorkedWithBefore == 'true') {
        // $query = $query . "requester_email IN (SELECT requester_email from tasks where tasker_email = 'huiying@gmail.com') AND ";
        $query = $query . "requester_email IN (SELECT requester_email from tasks where tasker_email = '". $_SESSION['login_user'] . "') AND ";
    } 
    if ($keyword) {
        $query = $query . "to_tsvector(description || '. ' || category || '. ' || address) @@ to_tsquery('{$keyword}') AND ";
    }

    $query = $query . "requester_email <>= '" . $_SESSION['login_user'] . "'";
}
// echo $query;
$result = pg_query($conn, $query);
$resultArray = pg_fetch_all($result);
echo json_encode($resultArray);
?>