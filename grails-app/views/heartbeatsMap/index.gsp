<html>
    <head>
        <title>Heartbeats Map</title>
        <meta name="layout" content="main" />
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>\
			<script src="${resource(dir:'js',file:'jquery-1.10.2.js')}"></script>
			<script>
// This example creates a 2-pixel-wide red polyline showing
// the path of William Kingsford Smith's first trans-Pacific flight between
// Oakland, CA, and Brisbane, Australia.
var map
function initialize() {
  var mapOptions = {
    zoom: 3,
    center: new google.maps.LatLng(14.558687, 121.019146),
    mapTypeId: google.maps.MapTypeId.TERRAIN
  };

  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

var user_id = 1;

jQuery.ajax({	
  url: '${resource(dir:'api',file:'heartbeats')}',
    data : {
    'uid' : user_id
  },
  success : function(resp) {
    drawMap(resp) ;
  }
});




  // Try HTML5 geolocation
  if(navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position) {
      var pos = new google.maps.LatLng(position.coords.latitude,
                                       position.coords.longitude);

      var infowindow = new google.maps.InfoWindow({
        map: map,
        position: pos,
        content: 'Location found using HTML5.'
      });

      map.setCenter(pos);
    }, function() {
      handleNoGeolocation(true);
    });
  } else {
    // Browser doesn't support Geolocation
    handleNoGeolocation(false);
  }
}

function drawMap(data) 
{
  var infowindow = new google.maps.InfoWindow();

  var marker, i;
  
  
	jQuery.each(data, function(key, list) {
      
        var myarr =[];
        
		jQuery.each(list, function(key, item) {
			marker = new google.maps.Marker({
			  position: new google.maps.LatLng(item.lat, item.lng),
			  map: map
			});
            
            myarr.push(new google.maps.LatLng(item.lat, item.lng));
        });
		
		google.maps.event.addListener(marker, 'click', (function(marker, i) {
		  return function() {
		    infowindow.setContent(item.date);
		    infowindow.open(map, marker);
		  }
		}));
        
        var flightPath = new google.maps.Polyline({
          path: myarr,
          geodesic: true,
          strokeColor: getRandomColor(),
          strokeOpacity: 1.0,
          strokeWeight: 2
        });
        
        flightPath.setMap(map);
	});



  
}


function handleNoGeolocation(errorFlag) {
  if (errorFlag) {
    var content = 'Error: The Geolocation service failed.';
  } else {
    var content = 'Error: Your browser doesn\'t support geolocation.';
  }

  var options = {
    map: map,
    position: new google.maps.LatLng(14.558687, 121.019146),
    content: content
  };

  var infowindow = new google.maps.InfoWindow(options);
  map.setCenter(options.position);
}

google.maps.event.addDomListener(window, 'load', initialize);

function getRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}

    </script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
	    <div id="map-canvas"></div>
    </body>
</html>
