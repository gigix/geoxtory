google.load('maps','3',{other_params:'sensor=false&language=zh'}); // load the maps api

function createMap() {	
	var myLatlng = new google.maps.LatLng(0, 0);
	var myOptions = {
		zoom: 4,
	    center: myLatlng,
	    mapTypeId: google.maps.MapTypeId.TERRAIN
	}
  	var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);

	var styles = [
	  {
		featureType: "all",
	    stylers: [
	      { saturation: -100 }
	    ]
	  }
	];
	map.setOptions({styles: styles});
		
	return map;
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
		
		google.maps.event.addListener(marker, "click", function(){
			$.gallery.gotoIndex(index);
		});
	});
	map.fitBounds(latlngbounds);	
}
