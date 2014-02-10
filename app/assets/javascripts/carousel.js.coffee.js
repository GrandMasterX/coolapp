jQuery ->
  $(".carousel").carousel({
  })

  $(".prev-slide").click ->
  $("#myCarousel").carousel "prev"
  return

  $(".next-slide").click ->
  $("#myCarousel").carousel "next"
  return
