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
  $that = this
  $(this).parent().parent().find(".tracks").toggle "slow", ->
    if $($that).text is "hide all"
      $($that).text "show all"
    else
      $($that).text "hide all"
    return

  return

$ ->
  $(".content-item.music-video").draggable helper: "clone"
  $(".widget-projection-widget").droppable
    hoverClass: "dropHere"
    drop: (event, ui) ->
      $(this).append $("<article class=\"content-item music-video\">"+ui.draggable.html()+"</article>")
      console.log $(this)

      $.ajax
      type: 'POST',
      contentType: "application/json",
      headers: "Content-Type": "application/json",
      url: "http://localhost:3000/tracks/changealbum/"+ui.draggable.attr("id")
      data: 
        album_id: $(this).attr("id")
      success: (data, textStatus, jqXHR) ->
        console.log data
      return

  return