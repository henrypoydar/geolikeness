map_ready = ->

  $map_element = $('#map-canvas')

  initialize_map = ->
    base_location = new google.maps.LatLng(
      App.map_location['latitude'], App.map_location['longitude'])
    map_options =
      center: base_location
      zoom: 8
      disableDefaultUI: true
      styles: App.map_style
      mapTypeId: google.maps.MapTypeId.TERRAIN
    gmap = new google.maps.Map($map_element.get(0), map_options)

  # HTML5 Geolocation API
  if navigator.geolocation
    locationSuccess = (position) ->
      App.map_location =
        latitude: position.coords.latitude
        longitude: position.coords.longitude
      initialize_map()
    locationFail = ->
      App.map_location =
        latitude: 40.6617
      initialize_map()
    navigator.geolocation.getCurrentPosition locationSuccess, locationFail
  else
    App.map_location =
      latitude: 40.6617
      longitude: -73.9708
    initialize_map()

$(document).ready(map_ready)