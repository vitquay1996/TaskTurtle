<?php
    require_once 'session.php';
?>
<!DOCTYPE html>
<body>
    <h2>Supply info to create task </h2>
    <?php
        //TODO: extract GET variables if there are
    ?>
    <form action="action_create_task.php" method="POST">
        <p>Task Category</p>
        <select name="category">
            <?php
            include('config.php');
            session_start();

            if (!isset($_SESSION['login_user'])) {
                header("Location: index.php");
            } else {
                $db = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
                $category = pg_query($db, "SELECT id, title FROM task_category");

                while ($row = pg_fetch_assoc($category)) {
                    echo "<option value=\"{$row['id']}\">{$row['title']}</option>";
                }
            }
            ?>
        </select>
        <p>Date</p>
        <input type="date" name="date"/>
        <p>Address</p>
        <input type="text" name="address"/><br/>
        <p>Task Description</p>
        <input type="text" name="task_description"/><br/>
        <p>Estimated duration</p>
        <input type="number" name="estimated_hours"/><br/>
        <input type="submit"/>

    </form>
    <?php
        echo "
            <button onclick=\"window.location.href = '/index.php'\">Home</button>
        ";
    ?>
</body>
</html>