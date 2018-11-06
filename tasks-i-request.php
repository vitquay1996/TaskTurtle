<?php
    if (!defined("APP_RUNNING")) die()
?>

<div class="ui pointing secondary menu">
    <a class="active item tasks-i-request" data-tab="upcoming-agreed-tasks">
        <div style="display: flex; justify-content: center; align-items: center">
            <i class="small blue circle icon"></i>Upcoming agreed tasks
        </div>
    </a>
    <a class="item tasks-i-request" data-tab="tasks-in-bidding">
        <div style="display: flex; justify-content: center; align-items: center">
            <i class="small yellow circle icon"></i>Tasks in bidding
        </div>
    </a>
    <a class="item tasks-i-request" data-tab="completed-tasks">
        <div style="display: flex; justify-content: center; align-items: center">
            <i class="small green circle icon"></i>Completed tasks
        </div>
    </a>
</div>

<div class="ui active tab tasks-i-request" data-tab="upcoming-agreed-tasks">
    <?php
        $db = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
        $myOwnTasks = pg_query($db, "SELECT * FROM tasks WHERE requester_email = '{$_SESSION['login_user']}' AND tasker_email IS NOT NULL AND is_finished = 0");
        if (pg_num_rows($myOwnTasks) == 0) {
            echo "
                <p align='center'>
                    <i>No task in this category currently</i>
                </p>
            ";
        } else {

        }
    ?>
</div>
<div class="ui tab tasks-i-request" data-tab="tasks-in-bidding">
    <?php
        $db = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
        $myOwnTasks = pg_query($db, "SELECT * FROM tasks WHERE requester_email = '{$_SESSION['login_user']}' AND tasker_email IS NULL");
        if (pg_num_rows($myOwnTasks) == 0) {
            echo "
                <p align='center'>
                    <i>No task in this category currently</i>
                </p>
            ";
        } else {
            echo "
                <table class='ui table celled'>
                    <thead>
                        <tr>
                            <th>Description</th>
                            <th>Date</th>
                            <th>From</th>
                            <th>Until</th>
                            <th>Number of bidders</th>
                            <th>Lowest bid</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    
                    <tbody>
            ";

            while ($row = pg_fetch_assoc($myOwnTasks)) {

            }

            echo "
                    </tbody>
                </table>
            ";
        }
    ?>
</div>
<div class="ui tab tasks-i-request" data-tab="completed-tasks">
    <?php
        $db = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
        $myOwnTasks = pg_query($db, "SELECT * FROM tasks WHERE requester_email = '{$_SESSION['login_user']}' AND tasker_email IS NOT NULL AND is_finished = 1");
        if (pg_num_rows($myOwnTasks) == 0) {
            echo "
                <p align='center'>
                    <i>No task in this category currently</i>
                </p>
            ";
        } else {

        }
    ?>
</div>