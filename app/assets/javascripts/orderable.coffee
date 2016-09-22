document.addEventListener "turbolinks:load", ->
  unless $("[data-behavior='orderable']").data('processed')
      $("[data-behavior='orderable']").data('processed', true)
      $("[data-behavior='orderable']").sortable(
        update: ->
          $.post $(this).data("order-url"), $(this).sortable('serialize')
      )
