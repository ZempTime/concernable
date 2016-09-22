document.addEventListener "turbolinks:load", ->
  unless $("[data-behavior='fileable']").data('processed')
      $("[data-behavior='fileable']").data('processed', true)
      $("[data-behavior='fileable']").draggable()
      $("[data-behavior='fileable']").droppable
        drop: (event, ui) ->
          dropped_on = $(this)
          window.huh = $(this)
          $.post dropped_on.data("filing-url"), target_id: ui.draggable.data("filing-id"), dataType: "script"


