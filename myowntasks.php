<!DOCTYPE html>  
<head>
    <title>My Own Tasks</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="myowntasks.js"></script>
    <style>li {list-style: none;}</style>
</head>

<body>
    <?php
        require_once 'config.php';
        session_start();
        if (!isset($_SESSION['login_user'])) {
            header('Location: /index.php');
        } else {
            $db = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
            $myOwnTasks = pg_query($db, "SELECT * FROM tasks WHERE owner_email = '{$_SESSION['login_user']}'");

            echo "<table>";
            echo "<tr>";
            echo "<th>" . "Task ID" . "</th>";
            echo "<th>" . "Description" . "</th>";
            echo "<th>" . "Details" . "</th>";

            while ($row = pg_fetch_assoc($myOwnTasks)) {
                echo "<tr>";
                echo "<td>" . $row['id'] . "</td>";
                echo "<td>" . $row['description'] . "</td>";
                echo "<td>";
                echo "<button class='task-details-button' data-taskid='{$row['id']}'>" . "Go to" . "</button>";
                echo "</td>";
                echo "</tr>";
            }

            echo "
                <button onclick=\"window.location.href = '/index.php'\">Home</button>
            ";
        }
    ?>
</body>
</html>