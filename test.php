

<!DOCTYPE html>
<html>
<body>

<?php
echo "My first PHP script!";
$email = "quang@u.com";
echo "INSERT INTO users VALUES ('" . $email . "'," . $email . "\', '9DE6FE1D', NULL, 'Nancy', '94406541', 'Hello, I am November!' )";
//echo "INSERT INTO users VALUES ( \'" . $email . "\'," . $email . "\'," . '9DE6FE1D', NULL, 'Nancy', '94406541', 'Hello, I am November!' )";

?>

<?php
require_once 'config.php';
$conn = pg_connect("host=" . DB_HOST . ", port=" . DB_PORT . ", dbname=" . DB_NAME);

$query = "SELECT * from users";

$result = pg_query($conn, $query);
while ($row = pg_fetch_row($result)) {
    echo "Author: $row[0]  E-mail: $row[1]";
    echo "<br />\n";
  }
?>

</body>
</html>