<!DOCTYPE html>
<head>
    <title>Discover</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="discover.js"></script>
    <style>li {list-style: none;}</style>
</head>

<body>
    <?php
        $db = pg_connect("host=127.0.0.1 port=5432 dbname=postgres user=postgres password=vietnamcongsan");
        $tasks = pg_query($db, "SELECT * FROM tasks");

        echo "
            <button onclick=\"window.location.href = '/index.php'\">Home</button>
        ";

        echo "<table>";
        echo "<tr>";
        echo "<th>"."Task ID"."</th>";
        echo "<th>"."Description"."</th>";
        echo "<th>"."Details"."</th>";

        while ($row = pg_fetch_assoc($tasks)) {
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
