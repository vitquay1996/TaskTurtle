$('#post-task-submit-button').click(() => {
    console.log({
        category: $("#post-task-category").val(),
        description: $("#post-task-description").val(),
        date: $("#post-task-date").val(),
        timestart: $("#post-task-timestart").val(),
        timeend: $("#post-task-timeend").val(),
        address: $("#post-task-address").val(),
    })
    $.ajax({
        url:"action_create_task.php", //the page containing php script
        type: "post", //request type,
        dataType: 'json',
        data: {
            category: $("#post-task-category").val(),
            description: $("#post-task-description").val(),
            date: $("#post-task-date").val(),
            timestart: $("#post-task-timestart").val(),
            timeend: $("#post-task-timeend").val(),
            address: $("#post-task-address").val(),
        },
        success: (result) => {
            if (result['success']) {
                window.location.href = 'index.php?page=tasks-i-request'
            } else {
                console.log(result)
            }
        },
        error: (error) => {
            console.log(error)
        }
    })
})