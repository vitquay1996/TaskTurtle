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
            $conn = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
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

            echo "<br/>";

            if (is_null($row['tasker_email'])) {
                if ($_SESSION['login_user'] == $row['owner_email']) {
                    echo "<p> You posted this task </p>";

                    $query = "SELECT * FROM bids WHERE task_id='" . $_GET['id'] . "'";
                    $result = pg_query($conn, $query);

                    if (pg_num_rows($result) == 0) {
                        echo "<p> No one bidded for your task </p>";
                    } else {
                        echo "<table>";
                        echo "<tr>";
                        echo "<th>Bidder</th>";
                        echo "<th>Price</th>";
                        echo "<th>Action</th>";
                        echo "</tr>";

                        while ($row = pg_fetch_assoc($result)) {
                            echo "<tr>";
                            echo "<td>{$row['tasker_email']}</td>";
                            echo "<td>{$row['price']}</td>";
                            echo "
                            <td>
                                <form action='/action_accept_bid.php' method='post'>
                                    <input type='submit' name='Accept'/>
                                    <input type='hidden' name='tasker_email' value='{$row['tasker_email']}'/>
                                    <input type='hidden' name='task_id' value='{$_GET['id']}'/>
                                </form>
                            </td>";
                            echo "</tr>";
                        }

                        echo "</table>";
                    }
                } else {
                    echo " />
                    </form>
                ";
                }
            } else {
                echo "This task has been successfully bidded";
            }

            echo "
                <button onclick=\"window.location.href = '/index.php'\">Home</button>
            ";
        ?> 
    </body>
</html>