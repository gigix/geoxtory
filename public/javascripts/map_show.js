google.load('maps','3',{other_params:'sensor=false&language=zh'}); // load the maps api

function createMap() {	
	var myLatlng = new google.maps.LatLng(0, 0);
	var myOptions = {
		zoom: 4,
	    center: myLatlng,
	    mapTypeId: google.maps.MapTypeId.ROADMAP
	}
  	var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	return customized(map);
}

function customized(map) {
	var styles = [
	  {
		featureType: "all",
	    stylers: [
	      { saturation: -80 }
	    ]
	  }
	];
	
	map.setOptions({
		panControl: false,
		mapTypeControl: false,
		streetViewControl: false,
		zoomControl: false,
		styles: styles
	});

	addControl(map, 'control map_button', function() {
		map.setOptions({mapTypeId: google.maps.MapTypeId.ROADMAP});
	});
	addControl(map, 'control satellite_button', function() {
		map.setOptions({mapTypeId: google.maps.MapTypeId.HYBRID});
	});
	return map;
}

function addControl(map, className, onclick) {
	var mapControl = document.createElement('div');
	mapControl.className = className;
	map.controls[google.maps.ControlPosition.RIGHT_TOP].push(mapControl);
	google.maps.event.addDomListener(mapControl, 'click', onclick);
}

function populateMap(map, csv_file) {
	$.ajax({
	  type: 'GET',
	  url: csv_file,
	  cache: false,
	  success: function(csv){ 
		markLocations(csv, map);	
	  }
	});		
}

function markLocations(csv, map) {
	var latlngbounds = new google.maps.LatLngBounds();
	var infowindow = new google.maps.InfoWindow({
		maxWidth: 400,
		content: "doesn't matter..."
	});

	$.each(parseCSV(csv), function(index, location) {
		var point = new google.maps.LatLng(location['Lat'], location['Long']);
		latlngbounds.extend(point);
		
		var marker = new google.maps.Marker({
			position: point,
			map: map,
			title: location['Name'],
		});
		
		var markerImage = new google.maps.MarkerImage('/images/marker.gif');
		// markerImage.scaledSize = new google.maps.Size(21, 14);
		marker.setIcon(markerImage);
		
		google.maps.event.addListener(marker, "click", function(){
			$.gallery.gotoIndex(index);
		});
	});
	map.fitBounds(latlngbounds);	
}
