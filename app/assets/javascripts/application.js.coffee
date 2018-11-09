# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file. JavaScript code in this file should be added after the last require_* statement.
#
# Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require semantic-ui
#= require_tree .

$(document).on('turbolinks:load', ->
  # Make sure all dropdowns are drop-downable
  $('.ui.dropdown').dropdown()

  # Make sure tabs behave like tabs
  $('.menu .item').tab()

  # Make sure all timepickers are timepickable
  $('.timepicker').timepicker(
    minTime: '6:00am'
    maxTime: '8:00pm'
    timeFormat: 'g:i A'
    step: 15
    scrollDefault: 'now'
  )

  # Make sure all datepickers are datepickable
  $('.datepicker').datepicker(
    autoSize: true
    dateFormat: "yy-mm-dd"
  )

  # Make sure all tables are sortable
  # $('.sortable.table').tablesort()

  # Since Rails error fields are wonky, we need to set the semantic error class correctly
  $.each($('input.error'), (i, val)->
    $(val.closest('.field')).addClass('error')
  )

  # Allow for dropdowns to be clearable
  $('.ui.clearable.dropdown').dropdown(
    onChange: (value, text, object)->
      target = object.closest(".ui.dropdown")
      if value
         target.find('.dropdown.icon').removeClass('dropdown').addClass('delete').on('click', ->
           $(this).removeClass('delete').addClass('dropdown')
           target.dropdown('clear')
         )
  )

  $('a.bookmark').on('ajax:success', (event, data) ->
    icon = $(this).find('i')
    if icon && data.style
      icon.attr('class', data.style)
  )

)
