$("#bid-button").click(() => {
    console.log("bid button clicked")

    $.ajax({
        url: 'action_bid.php',
        method: 'post',
        dataType: 'json',
        data: {
            taskId: $("#task-detail-modal").data('taskid'),
            bidPrice: $("#bid-price-input").val()
        },
        success: (result) => {
            if (result['success']) {
                window.location.href = 'index.php?page=tasks-i-bid'
            }
        },
        error: (error) => {
            console.log(error)
        }
    })
})