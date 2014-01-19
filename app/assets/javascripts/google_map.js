var map, marker;

function initialize() {
  var mapOptions = {
    zoom: 14,
    zoomControl: true,
    zoomControlOptions: {
      style: google.maps.ZoomControlStyle.DEFAULT,
      position: google.maps.ControlPosition.LEFT_CENTER
    },
    mapTypeControl: false, // set true for map/satellite option
    // mapTypeControlOptions: {
    //   style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR,
    //   position: google.maps.ControlPosition.BOTTOM_CENTER
    // },
    panControl: true,
    panControlOptions: {
      position: google.maps.ControlPosition.TOP_RIGHT
    },

  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
    mapOptions);

  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
       position.coords.longitude);

      infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'Current location'
      });

      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }

  // adds markers onClick
  google.maps.event.addListener(map, 'click', function(event) {
    latitude = event.latLng.lat();
    longitude = event.latLng.lng();
    //form ***********
    //console.log( latitude + ', ' + longitude );
    $('#item_latitude').val(latitude);
    $('#item_longitude').val(longitude);
    placeMarker(event.latLng);
  });
  var infowindow = new google.maps.InfoWindow( { maxWidth: 100 } );
  // How to dynamically render this in a js file
  $.get('/locations/1.json', function(data) {
    for (var i = 0; i < data.length; i++) {
      var position = new google.maps.LatLng(data[i].latitude, data[i].longitude);
      var item_id = data[i].id;
      //console.log(data);
      //debugger
      addMarkerWithWindow(i);
    }
    function addMarkerWithWindow(i) {
      var marker = new google.maps.Marker({
        position: position, map: map, clickable: true
      });
//      var location_name = '<a href="/locations/1/items/1">' + 'Iphone' + '</a>';
      var location_name = '<a href="/locations/'+ data[i].location_id +'/items/'+ data[i].id +'">'+ data[i].name +'</a>';
      //var location_name = '<a href="/locations/1/'+ item_id +'">' + 'hello' + '</a>';
      google.maps.event.addListener(marker, 'click', function(event) {
        infowindow.setContent(location_name);
        infowindow.open(map,marker);
      });
    }
  });
} // end initialize

function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(60, 105),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

// place new marker on map onClick, only allows 1 at a time
function placeMarker(location) {
  if (marker) { marker.setPosition(location);
  } else {
    marker = new google.maps.Marker({
      position: location,
      map: map
    });
  }
}

google.maps.event.addDomListener(window, 'load', initialize);
