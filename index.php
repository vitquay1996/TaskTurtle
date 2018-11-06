<?php
    define("APP_RUNNING", "APP_RUNNING");
    require_once('config.php');
    session_start();
?>

<html>
<head>
    <title>Task Turtle</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="index.js"></script>
    <script src="tasks-i-request.js"></script>
    <script src="semantic/semantic.js"></script>
    <link rel="stylesheet" href="semantic/semantic.css">
    <link rel="stylesheet" href="index.css">
    <style>li {list-style: none;}</style>
</head>

<body>
    <div id="top-bar">
        <h1 class="ui header" id="top-bar-app-name">Task Turtle</h1>
        <?php
            if (empty($_SESSION['login_user'])) {
                echo "
                <button class=\"ui button\" id=\"sign-in-button\">Sign In</button>
                <button class=\"ui button\" id=\"sign-up-button\">Sign Up</button>";

                echo "
                <div class=\"ui modal\" id=\"signin-modal\">
                    <div class=\"header\">
                        Sign In
                    </div>
                    <div class=\"content\">
                        <form class=\"ui form\">
                            <div class=\"field\">
                                <label>Email</label>
                                <input type=\"text\" name=\"email\" placeholder=\"Email\" id=\"login-email\">
                            </div>
                            <div class=\"field\">
                                <label>Password</label>
                                <input type=\"password\" name=\"password\" placeholder=\"Password\" id=\"login-password\">
                            </div>
                        </form>
                    </div>
                    <div class=\"actions\">
                        <div class=\"ui button\" id=\"signin-cancel-button\">Cancel</div>
                        <div class=\"ui button\" id=\"signin-submit-button\">Sign In</div>
                    </div>
                </div>";

                echo "
                <div class=\"ui modal\" id=\"signup-modal\">
                    <div class=\"header\">
                        Sign Up
                    </div>
                    <div class=\"content\">
                        <form class=\"ui form\">
                            <div class=\"field\">
                                <label>Email</label>
                                <input type=\"text\" name=\"email\" placeholder=\"Email\" id=\"signup-email\">
                            </div>
                            <div class=\"field\">
                                <label>Password</label>
                                <input type=\"password\" name=\"password\" placeholder=\"Password\" id=\"signup-password\">
                            </div>
                            <div class=\"field\">
                                <label>Full Name</label>
                                <input type=\"text\" name=\"fullname\" placeholder=\"Full Name\" id=\"signup-fullname\">
                            </div>
                            <div class=\"field\">
                                <label>Address</label>
                                <input type=\"text\" name=\"address\" placeholder=\"Address\" id=\"signup-address\">
                            </div>
                            <div class=\"field\">
                                <label>Phone</label>
                                <input type=\"number\" name=\"phone\" placeholder=\"Phone\" id=\"signup-phone\">
                            </div>
                            <div class=\"field\">
                                <label>Introduction</label>
                                <input type=\"text\" name=\"Introduction\" placeholder=\"Introduction\" id=\"signup-introduction\">
                            </div>
                        </form>
                    </div>
                    <div class=\"actions\">
                        <div class=\"ui button\" id=\"signup-cancel-button\">Cancel</div>
                        <div class=\"ui button\" id=\"signup-submit-button\">Sign Up</div>
                    </div>
                </div>";
            } else {
                echo "
                <i class=\"big user circle outline icon inverted\" id='user-icon'></i>
                <div id='user-name-top-bar'>{$_SESSION['login_user']}</div>
                <button class=\"ui button\" id=\"sign-out-button\">Sign Out</button>";
            }
        ?>
    </div>

    <?php
        if (empty($_SESSION['login_user'])) {
            echo "
                
            ";
        } else {
            echo "
                <div id='main-content'>
                    <div>
                        <div class=\"ui vertical menu raised\">
                            <a class=\"item\" id='side-menu-home-item'>
                                <i class=\"left home icon\"></i>
                                Home
                            </a>
                            <a class=\"item\" id='side-menu-tasks-i-request-item'>
                                <i class=\"left bullhorn icon\"></i>
                                Tasks I request
                                <div class=\"ui label\" id='side-menu-tasks-i-request-label'>1</div>
                            </a>
                            <a class=\"item\" id='side-menu-tasks-i-bid-for-item'>
                                <i class=\"left gavel icon\"></i>
                                Tasks I bid for
                                <div class=\"ui label\" id='side-menu-tasks-i-bid-for-label'>51</div>
                            </a>
                            <a class=\"item\" id='side-menu-find-new-tasks-item'>
                                <i class=\"left search icon\"></i>
                                Find new tasks
                            </a>
                            <a class=\"item\" id='side-menu-post-new-task-item'>
                                <i class=\"left plus icon\"></i>
                                Post a new task
                            </a>
                        </div>
                    </div>    
                    <div class='ui segment' id='displayed-page'>";

            switch($_GET['page']) {
                case "home": {
                    break;
                }
                case "tasks-i-request": {
                    include("tasks-i-request.php");
                    break;
                }
                case "tasks-i-bid": {
                    break;
                }
                case 'post-task': {
                    include("post-new-task.php");
                    echo "<script src=\"post-new-task.js\"></script>";
                    break;
                }
                case 'find-tasks': {
                    include("find-new-tasks.php");
                    echo "<script src=\"find-new-tasks.js\"></script>";
                    break;
                }
                default: {
                    header("Location: index.php?page=home");
                }
            }


            echo "
                    </div>
                </div>
            ";

            include("task-detail-modal.php");
            echo "<script src=\"task-detail-modal.js\"></script>";
        }
    ?>

</body>

</html>