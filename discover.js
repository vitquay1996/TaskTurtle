$( document ).ready(() => {
    $(".task-details-button").each(function(index) {
        let taskid = $(this).data('taskid')
        $(this).click(() => {
            window.location.href = "/task_details.php?id=" + taskid;
        })
    })
})