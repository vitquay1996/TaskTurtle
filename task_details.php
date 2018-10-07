<?php
    require_once 'config.php';
    require_once 'session.php';
?>
<!DOCTYPE html>
    <head>
    <title>Show task details</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <style>
        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
    </head>
    <body> 
        <h2>Details of task with id </h2>
        <?php
            //TODO: refactor
            $conn = pg_connect("host=" . DB_HOST . ", port=" . DB_PORT . ", dbname=" . DB_NAME);
            $query = "SELECT * FROM tasks WHERE id='" . $_GET['id'] . "'";
            $result = pg_query($conn, $query);
            $row = pg_fetch_assoc($result);
            echo "<table>
                    <tr> 
                        <th> owner_email </th>
                        <th> tasker_email </th>
                        <th> task_category_id </th>
                        <th> date_time </th>
                        <th> address </th>
                        <th> description </th>
                        <th> est_hours </th>
                        <th> is_finished </th>
                        <th> is_paid</th>
                    <tr>
                    <td>" . $row['owner_email'] . "</td>
                    <td>" . $row['tasker_email'] . "</td>
                    <td>" . $row['task_category_id'] . "</td>
                    <td>" . $row['date_time'] . "</td>
                    <td>" . $row['address'] . "</td>
                    <td>" . $row['description'] . "</td>
                    <td>" . $row['est_hours'] . "</td>
                    <td>" . $row['is_finished'] . "</td>
                    <td>" . $row['is_paid'] . "</td>
                </table>"; 
        ?> 
    </body>
</html>