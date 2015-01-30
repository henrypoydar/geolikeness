map_ready = ->

  $map_element = $('#map-canvas')

  initialize_map = ->
    base_location = new google.maps.LatLng(
      App.map_location['latitude'], App.map_location['longitude'])
    map_options =
      center: base_location
      zoom: App.map_location['zoom']
      disableDefaultUI: true
      styles: App.map_style
      mapTypeId: google.maps.MapTypeId.TERRAIN
    gmap = new google.maps.Map($map_element.get(0), map_options)
    google.maps.event.addListener gmap, "click", (event) ->
      console.log event.latLng
      console.log gmap.getZoom()

      marker = new google.maps.Marker(
        position: event.latLng
        map: gmap
      )
      return

  App.map_location =
    latitude: 44.69535234555909
    longitude: -114.71782207489014
    zoom: 15
  initialize_map()

$(document).ready(map_ready)