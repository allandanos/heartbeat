<html>
    <head>
        <title>Active Fault Line</title>
        <meta name="layout" content="main" />
		<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=true"></script>
		<script>
	// This example creates a 2-pixel-wide red polyline showing
	// the path of William Kingsford Smith's first trans-Pacific flight between
	// Oakland, CA, and Brisbane, Australia.
	var map
	function initialize() {
	  var mapOptions = {
		zoom: 3,
		center: new google.maps.LatLng(14.558687, 121.019146),
		mapTypeId: google.maps.MapTypeId.ROAD
	  };

	  map = new google.maps.Map(document.getElementById('map-canvas'),
		  mapOptions);
	  // Note the KML/KMZ must be a publically accessible URL
	  var kmzLayer = new google.maps.KmlLayer('http://images.gmanews.tv/2012/activefaults-all_polyline.kmz');
		kmzLayer.setMap(map);
	}


	google.maps.event.addDomListener(window, 'load', initialize);

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
