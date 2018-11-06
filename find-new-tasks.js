$(".task-details-button").each(function(index) {
    let taskid = $(this).data('taskid')

    $(this).click(() => {
        $.ajax({
            url: 'action_get_task_details.php',
            method: 'post',
            dataType: 'json',
            data: {
                taskId: taskid
            },
            success: (result) => {
                console.log(result)
                $('#task-detail-description').text(result['description'])
                $('#task-detail-date-and-time').text("From " + result['timeStart'] + " to " + result['timeEnd'] + " on " + result['date'])
                $('#task-detail-address').text(result['address'])
                $('#task-detail-category').text(result['customCategory'])
                $("#task-detail-modal").modal("show")
                $("#task-detail-modal").data('taskid', taskid)
            },
            error: (error) => {
                console.log(error)
            }
        })

    })
})