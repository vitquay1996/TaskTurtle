<?php
if (!defined("APP_RUNNING")) die()
?>

<h2 class="ui dividing header">
    <div style="display: flex; justify-content: left">
        <i class="search icon"></i>Find new tasks
    </div>
</h2>

<table class="ui table celled">
    <thead>
        <tr>
            <th>Description</th>
            <th>Date</th>
            <th>From</th>
            <th>To</th>
            <th>Number of bidders</th>
            <th>Lowest bid</th>
            <th class="center aligned">Action</th>
        </tr>
    </thead>
    <tbody>

    <?php
        $db = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
        $tasks = pg_query($db, "SELECT * FROM tasks WHERE requester_email != '{$_SESSION['login_user']}'");

        while ($row = pg_fetch_assoc($tasks)) {
            echo "<tr>";
            echo "<td>{$row['description']}</td>";
            echo "<td>{$row['date']}</td>";
            echo "<td>{$row['time_start']}</td>";
            echo "<td>{$row['time_end']}</td>";
            echo "<td>?</td>";
            echo "<td>?</td>";
            echo "<td class=\"center aligned\">";
            echo "<button class='ui small button task-details-button' data-taskid='{$row['id']}'>"."Details"."</button>";
            echo "</td>";
            echo "</tr>";
        }
    ?>

    </tbody>
</table>