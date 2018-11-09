$(document).on('click', 'a[data-remote]', (event, b, c) ->
  icon = $(this).find('i')
  if icon
    style = icon.attr('class')
    if style.includes('outline')
      icon.attr('class', 'yellow star icon')
    else
      icon.attr('class', 'yellow star outline icon')
)