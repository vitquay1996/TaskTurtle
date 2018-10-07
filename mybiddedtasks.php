<!DOCTYPE html>
<head>
    <title>My Bidded Tasks</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="mybiddedtasks.js"></script>
    <style>li {
            list-style: none;
        }</style>
</head>

<body>

    <?php
        include 'session.php';
        session_start();
        $db = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
        $myOwnTasks = pg_query($db, "SELECT * FROM bids WHERE tasker_email = '{$_SESSION['login_user']}';");

        echo "<table>";
        echo "<tr>";
        echo "<th>" . "Task ID" . "</th>";
        echo "<th>" . "Details" . "</th>";
        echo "<th>" . "My bid" . "</th>";

        while ($row = pg_fetch_assoc($myOwnTasks)) {
            echo "<tr>";
            echo "<td>" . $row['task_id'] . "</td>";
            echo "<td>";
            echo "<button class='task-details-button' data-taskid='{$row['task_id']}'>" . "Go to" . "</button>";
            echo "</td>";
            echo "<td>" . $row['price'] . "</td>";
            echo "</tr>";
        }

        echo "
            <button onclick=\"window.location.href = '/index.php'\">Home</button>
        ";
    ?>
</body>
</html>