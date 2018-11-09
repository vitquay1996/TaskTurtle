<?php
require_once 'config.php';
require_once 'session.php';
extract($_POST);

$conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
$query = "SELECT u.rating_tasker, u.rating_requester from users u where u.email = '{$_SESSION['login_user']}'";
$result = pg_query($conn, $query);
$ratingRow = pg_fetch_assoc($result);

$query = "SELECT count(*) as count from tasks t where t.requester_email = '{$_SESSION['login_user']}' and is_finished = 1";
$result = pg_query($conn, $query);
$taskCountRow = pg_fetch_assoc($result);

$query = "SELECT count(*) as count from tasks t where t.tasker_email = '{$_SESSION['login_user']}' and is_finished = 1";
$result = pg_query($conn, $query);
$jobCountRow = pg_fetch_assoc($result);

echo json_encode(array(
    "ratingTasker" => $ratingRow['rating_tasker'],
    "ratingRequester" => $ratingRow['rating_requester'],
    "taskCount" => $taskCountRow['count'],
    "jobCount" => $jobCountRow['count']
))
?>