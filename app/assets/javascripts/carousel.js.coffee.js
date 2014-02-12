$ ->
  $(".carousel").carousel({
  })

  $(".prev-slide").click ->
  	$("#myCarousel").carousel "prev"
  return

  $(".next-slide").click ->
  	$("#myCarousel").carousel "next"
  return

$(".content-item.music-video").draggable

$ ->
	$(".widget-ourWork").droppable
	  tolerance: "fit"
	  accept: ".content-item.music-video"
	  drop: (event, ui) ->
	    $(this).append ui.draggable
	    console.log this

	    return
$ ->
	$(".counts a").on "click", ->

  $that = $(this)

  $(this).parent().parent().find(".tracks").toggle "slow", ->
    if $that.text is "show all"
      $that.text "hide all"
    else
      $that.text "show all"

    return

  return

$ ->
  $(".content-item.music-video").draggable()
  $(".widget-projection-widget").droppable
    hoverClass: "dropHere"
    drop: (event, ui) ->
      $(this).append $("<article class=\"content-item music-video\">" + ui.draggable.html() + "</article>")
      $.ajax
        type: "POST"
        url: "http://localhost:3000/tracks/changealbum/" + ui.draggable.attr("id")
        dataType: 'json'
        data:
          album_id: $(this).attr("id")

      return

  return
