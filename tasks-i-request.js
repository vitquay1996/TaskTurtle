$('.item.tasks-i-request').click(() => {
    $('.active.item.tasks-i-request').removeClass('active')
    $('.active.tab.tasks-i-request').removeClass('active')

    $(this).addClass('active')
    let linkedTab = $(this).attr('data-tab')
    $('.tab.tasks-i-request[data-tab=\"' + linkedTab + '\"]').addClass('active')
})