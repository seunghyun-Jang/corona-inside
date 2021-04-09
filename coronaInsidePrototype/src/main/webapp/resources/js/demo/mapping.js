
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

/*
function searchAddressToCoordinate(address) {
	naver.maps.Service
			.geocode(
					{
						query : address
					},
					function(status,
							response) {
						if (status === naver.maps.Service.Status.ERROR) {
							if (!address) {
								return alert('Geocode Error, Please check address');
							}
							return alert('Geocode Error, address:'
									+ address);
						}
						if (response.v2.meta.totalCount === 0) {
							console
									.log(address);
							return alert('No result.');
						}
						var htmlAddresses = [], item = response.v2.addresses[0], point = new naver.maps.Point(
								item.x,
								item.y), marker = new naver.maps.Marker(
								{
									position : new naver.maps.LatLng(
											item.y,
											item.x),
									map : map
								});
						var infoWindow = new naver.maps.InfoWindow(
								{
									anchorSkew : true
								});
						if (item.roadAddress) {
							htmlAddresses
									.push('[도로명 주소] '
											+ item.roadAddress);
						}
						if (item.jibunAddress) {
							htmlAddresses
									.push('[지번 주소] '
											+ item.jibunAddress);
						}
						

						console.log(item.x + ", " + item.y + ", " + item.jibunAddress);
						
						infoWindow
								.setContent([
										'<div style="padding:10px;max-width:300px;line-height:150%;">',
										'<h5 style="margin-top:5px;">검색 주소 : '
												+ address
												+ '</h5><br />',
										htmlAddresses
												.join('<br />'),
										'</div>' ]
										.join('\n'));
						function getClickHandler() {
							return function(
									e) {
								if (infoWindow
										.getMap()) {
									infoWindow
											.close();
								} else {
									infoWindow
											.open(
													map,
													marker);
								}
							}
						}
						map
								.setCenter(point);
						//infoWindow.open(map,marker);
						map.setZoom(18);
						//marker.setMap(map);
						naver.maps.Event
								.addListener(
										marker,
										'click',
										getClickHandler());
					});
}

*/


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

	/*
	if (flag == 0) {
		flag = 1;
	} else if (flag == 1) {
		var count = 0;
		for (var i = 0; i < 5; i++) {
			//searchAddressToCoordinate(arr2[i]);
			mapping(arr1[i], arr2[i], arr3[i]);
			//console.log(arr2[i]);
			count++;
		}
		console.log(count);
		flag = 0;
	}
	*/
	for (var i = 0; i < arr1.length; i++) {
		mapping(arr1[i], arr2[i], arr3[i]);
		
	}

	/*  map.addListener(marker, "click", function(e) {
		if (infowindow.getMap()) {
			infowindow.close();
		} else {
			infowindow.open(map, marker);
		}
	 }) */
	//searchAddressToCoordinate(code0);
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

    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
    map.setZoom(18); // 지도의 줌 레벨을 변경합니다.

    
}

function onErrorGeolocation() {
    var center = map.getCenter();
}

$(window).on("load", function() {
    if (navigator.geolocation) {
        /**
         * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
         * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
         * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
         */
        navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
    } else {
        var center = map.getCenter();
        
    }
});