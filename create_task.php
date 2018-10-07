<!DOCTYPE html>
<head> 
<body> 
    <h2>Supply info to create task </h2>
    <form action="create_task.php" method="POST">
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
        include('config.php');
        session_start();

        if (!isset($_SESSION['login_user'])) {
            header("Location: /index.php");
        } else {
            if (!empty($_POST['submit']) && isset($_POST['category'], $_POST['date'], $_POST['address'], $_POST['task_description'], $_POST['estimated_hours'])) {
                $db = pg_connect("host={$DB_HOST} port={$DB_PORT} dbname={$DB_NAME} user={$DB_USER} password={$DB_PASS}");
                $uuid = uuid();
                $result = pg_query($db, "INSERT INTO tasks VALUES ({$uuid}, {$_SESSION['login_user']}, NULL, {$_POST['category']}, {$_POST['date']}, {$_POST['address']}, {$_POST['task_description']}, {$_POST['estimated_hours']}, 0, 0)");

                if (!$result) {
                    header("Location: /index.php");
                } else {
                    header("Location: /myowntasks.php");
                }
            } else {
                echo "lower";
            }
        }

        function uuid() {
            return sprintf('%04x%04x-%04x-%04x-%04x-%04x%04x%04x',
                mt_rand(0, 0xffff), mt_rand(0, 0xffff),
                mt_rand(0, 0xffff),
                mt_rand(0, 0x0fff) | 0x4000,
                mt_rand(0, 0x3fff) | 0x8000,
                mt_rand(0, 0xffff), mt_rand(0, 0xffff), mt_rand(0, 0xffff)
            );
        }
    ?>
