$ ->
  modal_holder_selector = '#modal-holder'
  modal_selector = '.modal'

  $(document).on 'page:change', ->
    $('textarea').autosize()
    
  $(document).on 'click', 'a[data-modal]', ->
    location = $(this).attr('href')
    #Load modal dialog from server
    $.get location, (data)->
      $(modal_holder_selector).html(data).
      find(modal_selector).modal()
    false

  $(document).on 'ajax:success',
    'form[data-modal]', (event, data, status, xhr)->
      $(".modal-dialog").modal('hide')
      url = xhr.getResponseHeader('Location')
      if url
        # Redirect to url
        window.location = url
      else
        # Remove old modal backdrop
        $('.modal-backdrop').remove()
        # Replace old modal with new one
        $(modal_holder_selector).html(data).
        find(modal_selector).modal()
      false
