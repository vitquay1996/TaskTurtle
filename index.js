$(document).ready(() => {
    let signInButton = $("#sign-in-button");
    let signUpButton = $("#sign-up-button");
    let signInCancelButton = $("#signin-cancel-button")
    let signInSubmitButton = $("#signin-submit-button")
    let signUpCancelButton = $("#signup-cancel-button")
    let signUpSubmitButton = $("#signup-submit-button")
    let signOutButton = $("#sign-out-button")
    let mainContent = $("#main-content")
    let displayedPage = $("#displayed-page")
    let topBar = $("#top-bar")

    setTimeout(() => {
        let signInButtonLength = signInButton.width();
        let signUpButtonLength = signUpButton.width();
        console.log(signInButtonLength);
        console.log(signUpButtonLength);
        if (signInButtonLength < signUpButtonLength) {
            signInButton.width(signUpButtonLength);
        } else {
            signUpButton.width(signInButtonLength);
        }

        displayedPage.height(window.innerHeight - topBar.outerHeight() - 90)
    }, 100)

    let urlParams = new URLSearchParams(window.location.search);
    let page = urlParams.get('page');

    switch (page) {
        case 'home': {
            $("#side-menu-home-item").addClass("active");
            break;
        }
        case 'tasks-i-request': {
            $("#side-menu-tasks-i-request-item").addClass("active");
            $("#side-menu-tasks-i-request-label").addClass("teal");
            break;
        }
        case 'tasks-i-bid': {
            $("#side-menu-tasks-i-bid-for-item").addClass("active");
            $("#side-menu-tasks-i-bid-for-label").addClass("teal");
            break;
        }
        case 'post-task': {
            $("#side-menu-post-new-task-item").addClass("active");
            $("#side-menu-post-new-task-label").addClass("teal");
            break;
        }
        case 'find-tasks': {
            $("#side-menu-find-new-tasks-item").addClass("active");
            $("#side-menu-find-new-tasks-label").addClass("teal");
            break;
        }
    }

    $("#side-menu-home-item").click(() => window.location.href = 'index.php?page=home')
    $("#side-menu-tasks-i-request-item").click(() => window.location.href = 'index.php?page=tasks-i-request')
    $("#side-menu-tasks-i-bid-for-item").click(() => window.location.href = 'index.php?page=tasks-i-bid')
    $("#side-menu-post-new-task-item").click(() => window.location.href = 'index.php?page=post-task')
    $("#side-menu-find-new-tasks-item").click(() => window.location.href = 'index.php?page=find-tasks')

    $(".ui.modal").modal({
        dimmerSettings: {opacity: 0.5}
    });

    signInCancelButton.on('click', () => {
        $("#signin-modal").modal('hide');
    })

    signUpCancelButton.on('click', () => {
        $("#signup-modal").modal('hide');
    })

    signInSubmitButton.on('click', () => {
        $.ajax({
            url:"action_login.php", //the page containing php script
            type: "post", //request type,
            dataType: 'json',
            data: {
                email: $("#login-email").val(),
                password: $("#login-password").val()
            },
            success: (result) => {
                if (result['success']) {
                    window.location.href = 'index.php'
                } else {
                    alert("Failed")
                }
            },
            error: (error) => {
                console.log(error)
            }
        });
    })

    signInButton.on('click', () => {
        console.log("sign in clicked")
        $("#signin-modal").modal('show');
    })

    signUpButton.on('click', () => {
        $("#signup-modal").modal('show');
    })

    signUpSubmitButton.on('click', () => {
        // console.log($("#signup-email").val(),
        //     $("#signup-password").val(),
        //     $("#signup-phone").val(),
        //     $("#signup-address").val(),
        //     $("#signup-introduction").val(),
        //     $("#signup-fullname").val())
        $.ajax({
            url:"action_signup.php", //the page containing php script
            type: "post", //request type,
            dataType: 'json',
            data: {
                email: $("#signup-email").val(),
                password: $("#signup-password").val(),
                phone: $("#signup-phone").val(),
                address: $("#signup-address").val(),
                introduction: $("#signup-introduction").val(),
                fullname: $("#signup-fullname").val(),
            },
            success: (result) => {
                if (result['success']) {
                    window.location.href = 'index.php'
                } else {
                    alert("Failed")
                }
            },
            error: (error) => {
                console.log(error)
            }
        });
    })

    signOutButton.on('click', () => {
        $.ajax({
            url:"logout.php",
            type: "post",
            dataType: 'json',
            success: (result) => {
                console.log(result['success'])
                if (result['success']) {
                    window.location.href = 'index.php'
                } else {
                    alert("Failed")
                }
            },
            error: (error) => {
                console.log(error)
            }
        })
    })

    $('.menu .item').tab();
})