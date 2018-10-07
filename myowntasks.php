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
    //    session_start();
    //    if (isset($_SESSION['user'])) {
    //        header('Location: /logged_out.php');
    //    } else {
    //        $db = pg_connect("host=127.0.0.1 port=5432 dbname=postgress user={$_SESSION['user']} password={$_SESSION['password']}");
        $db = pg_connect("host=127.0.0.1 port=5432 dbname=postgres user=postgres password=vietnamcongsan");
        $myOwnTasks = pg_query($db, "SELECT * FROM tasks WHERE owner_email = 'whiskey@gmail.com'");

        echo "<table>";
        echo "<tr>";
        echo "<th>"."Task ID"."</th>";
        echo "<th>"."Description"."</th>";
        echo "<th>"."Details"."</th>";

        while ($row = pg_fetch_assoc($myOwnTasks)) {
            echo "<tr>";
            echo "<td>".$row['id']."</td>";
            echo "<td>".$row['description']."</td>";
            echo "<td>";
                echo "<button class='task-details-button' data-taskid='{$row['id']}'>"."Go to"."</button>";
            echo "</td>";
            echo "</tr>";
        }

    ?>
</body>
</html>