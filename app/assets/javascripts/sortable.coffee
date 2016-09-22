document.addEventListener "turbolinks:load", ->
  unless $("[data-behavior='sortable-cards']").data('processed')
      $("[data-behavior='sortable-cards']").data('processed', true)
      $("[data-behavior='sortable-cards']").sortable(
        update: ->
          $.post $(this).data("order-url"), $(this).sortable('serialize')
      )
