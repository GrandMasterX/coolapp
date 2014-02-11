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



dragStart = (ev) ->
  ev.dataTransfer.effectAllowed = "copy"
  ev.dataTransfer.setData "Text", ev.target.getAttribute("id")
  true


dragEnter = (ev) ->
  event.preventDefault()
  true


dragOver = (ev) ->
  false


dragDrop = (ev) ->
  eleid = ev.dataTransfer.getData("Text")
  ev.target.appendChild document.getElementById(eleid)
  ev.preventDefault()
  return


