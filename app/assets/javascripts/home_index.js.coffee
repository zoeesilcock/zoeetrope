$ =>
  timeout = null

  $('.photo img').click (event)=>
    $(event.target).attr('src', '/assets/zoee_silly.jpg')

    if (timeout)
      window.clearTimeout(timeout)

    timeout = window.setTimeout (=>
      $(event.target).attr('src', '/assets/zoee.jpg')
    ), 2000
