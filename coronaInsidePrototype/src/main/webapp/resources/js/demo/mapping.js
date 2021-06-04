
var map = new naver.maps.Map("map", {
	zoom: 15,
	mapTypeControl: true

});

var bounds = map.getBounds(),
    southWest = bounds.getSW(),
    northEast = bounds.getNE(),
    lngSpan = northEast.lng() - southWest.lng(),
    latSpan = northEast.lat() - southWest.lat();

var markers = [];

map.setCursor('pointer');


function mapping(x, y, address) {

	var point = new naver.maps.Point(x, y), marker = new naver.maps.Marker({
		position: new naver.maps.LatLng(y, x),
		map: map
	});
	var infoWindow = new naver.maps.InfoWindow({
		maxWidth: 300,
		backgroundColor: "#f8f9fc",
    	borderColor: "#6f42c1",
   	 	borderWidth: 5,
		anchorSize: new naver.maps.Size(30, 30),
		anchorSkew: true,
		anchorColor: "#f8f9fc",
	});
	infoWindow.setContent([
		'<div style="padding:10px;max-width:300px;line-height:150%;">',
		'<h5 style="margin-top:5px;">'
		+ address
		+ '</h5><br />',
		'</div>'].join('\n'));
	function getClickHandler() {
		return function(e) {
			if (infoWindow.getMap()) {
				infoWindow.close();
			} else {
				infoWindow.open(map, marker);
			}
		}
	}
	markers.push(marker);
	//map.setCenter(point);
	//infoWindow.open(map,marker);
	map.setZoom(18);
	//marker.setMap(map);
	naver.maps.Event.addListener(marker, 'click', getClickHandler());

}
function initGeocoder() {

	if (!map.isStyleMapReady) {
		return;
	}

	
	for (var i = 0; i < arr1.length; i++) {
		mapping(arr1[i], arr2[i], arr3[i]);
		
	}

	
}
naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
naver.maps.Event.addListener(map, 'idle', function() {
    updateMarkers(map, markers);
});

function updateMarkers(map, markers) {

    var mapBounds = map.getBounds();
    var marker, position;

    for (var i = 0; i < markers.length; i++) {

        marker = markers[i]
        position = marker.getPosition();

        if (mapBounds.hasLatLng(position)) {
            showMarker(map, marker);
        } else {
            hideMarker(map, marker);
        }
    }
}

function showMarker(map, marker) {

    if (marker.getMap()) return;
    marker.setMap(map);
}

function hideMarker(map, marker) {

    if (!marker.getMap()) return;
    marker.setMap(null);
}



function onSuccessGeolocation(position) {
    var location = new naver.maps.LatLng(position.coords.latitude,
                                         position.coords.longitude);

    map.setCenter(location); 
    map.setZoom(18);
    
}

function onErrorGeolocation() {
    var center = map.getCenter();
}

$(window).on("load", function() {
    if (navigator.geolocation) {
        
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    } else {
        var center = map.getCenter();
        
    }
});