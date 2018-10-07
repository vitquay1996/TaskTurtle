<html>
<head>
    <title>My Own Tasks</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="myowntasks.js"></script>
    <style>li {list-style: none;}</style>
</head>

<body>
    <h2 align="center">Task Turtle</h2>
    <h3 align="center">A task sourcing website</h3>

    <?php
        require_once('config.php');
        session_start();

        if (empty($_SESSION['login_user'])) {
            echo "
                <div align='center'>
                    <button onclick=\"window.location.href = '/login.php'\">Sign In</button>
                    <button onclick=\"window.location.href = '/signup.php'\">Sign Up</button>
                </div>
            ";
        } else {
            echo "
                <div align='center'>
                    <button onclick=\"window.location.href = '/myowntasks.php'\">Tasks I posted</button>
                    <button onclick=\"window.location.href = '/mybiddedtasks.php'\">Tasks I bidded</button>
                    <button onclick=\"window.location.href = '/discover.php'\">Find new tasks</button>
                    <button onclick=\"window.location.href = '/create_task.php'\">Post a new task</button>
                </div>
                
                <div align='center'>
                    <button onclick=\"window.location.href = '/logout.php'\">Log Out</button>
                </div>
            ";
        }
    ?>

</body>

</html>