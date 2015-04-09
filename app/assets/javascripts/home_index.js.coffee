$ =>
  timeout = null

  $('.photo img').click (event)=>
    $(event.target).attr('src', $(event.target).data('silly-path'))

    if (timeout)
      window.clearTimeout(timeout)

    timeout = window.setTimeout (=>
      $(event.target).attr('src', $(event.target).data('path'))
    ), 2000
