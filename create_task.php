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
      Title: <input type="text" name="title"><br>
      Description: <input type="text" name="description"><br>
        <!-- TODO: dropdown for category -->
      Category: <input type="text" name="category"><br>
      Estimated time in hours: <input type="text" name="est_hours"><br>
      <input type="submit">
    </form>
</body>
</html>