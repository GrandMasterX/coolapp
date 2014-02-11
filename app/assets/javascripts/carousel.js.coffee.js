jQuery ->
  $(".carousel").carousel({
  })

  $(".prev-slide").click ->
  $("#myCarousel").carousel "prev"
  return

  $(".next-slide").click ->
  $("#myCarousel").carousel "next"
  return

$ ->
  $("#tracks,.widget-projection-widget").sortable(connectWith: ".widget-ourWork").disableSelection()
  return
