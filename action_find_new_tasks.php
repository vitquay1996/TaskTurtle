<?php

require 'session.php';

$conn = pg_connect("host=" . DB_HOST . " port=" . DB_PORT . " dbname=" . DB_NAME . " user=" . DB_USER . " password=" . DB_PASS);
$query = "SELECT * FROM tasks WHERE requester_email <> '{$_SESSION['login_user']}'";

$result = pg_query($conn, $query);
$resultArray = pg_fetch_all($result);
echo json_encode($resultArray);