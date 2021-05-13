function drawMap(target) {
	var width = 700; //지도의 넓이
	var height = 700; //지도의 높이
	var initialScale = 5500; //확대시킬 값
	var initialX = -11900; //초기 위치값 X
	var initialY = 4050; //초기 위치값 Y
	var labels;



	var projection = d3.geo
		.mercator()
		.scale(initialScale)
		.translate([initialX, initialY]);
	var path = d3.geo.path().projection(projection);
	
	/*
	var zoom = d3.behavior
		.zoom()
		.translate(projection.translate())
		.scale(projection.scale())
		.scaleExtent([height, 800 * height])
		.on('zoom', zoom);
	*/
	var svg = d3
		.select(target)
		.append('svg')
		.attr('width', "100%")
		.attr('height', "100%")
		.attr("viewBox", "0 0 960 700")
		.attr("preserveAspectRatio", "none")
		.attr('id', 'map')
		.attr('class', 'map');

	var states = svg
		.append('g')
		.attr('id', 'states');
		//.call(zoom);

	states
		.append('rect')
		.attr('class', 'background')
		.attr('width', width + 'px')
		.attr('height', height + 'px')
		

	//geoJson데이터를 파싱하여 지도그리기
	d3.json('resources/json/korea.json', function(json) {
		states
			.selectAll('path') //지역 설정
			.data(json.features)
			.enter()
			.append('path')
			.attr('d', path)
			.attr('id', function(d) {
				return 'path-' + d.properties.name_eng;
			})
			.on("mouseover", function() { tooltip.style("display", null); })
			.on("mouseout", function() { tooltip.style("display", "none"); })
			.on("mousemove", function(d) {
				tooltip.style("left", (d3.event.pageX + 10) + "px");
				tooltip.style("top", (d3.event.pageY - 10) + "px");

				if (d.properties.code == 39) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar0}`+" 명");
				}
				else if (d.properties.code == 38) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar1}`+" 명");
				}

				else if (d.properties.code == 37) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar2}`+" 명");
				}

				else if (d.properties.code == 36) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar3}`+" 명");
				}
				else if (d.properties.code == 35) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar4}`+" 명");
				}
				else if (d.properties.code == 34) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar5}`+" 명");
				}
				else if (d.properties.code == 33) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar6}`+" 명");
				}
				else if (d.properties.code == 32) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar7}`+" 명");
				}
				else if (d.properties.code == 31) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar8}`+" 명");
				}
				else if (d.properties.code == 29) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar9}`+" 명");
				}
				else if (d.properties.code == 26) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar10}`+" 명");
				}
				else if (d.properties.code == 25) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar11}`+" 명");
				}
				else if (d.properties.code == 24) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar12}`+" 명");
				}
				else if (d.properties.code == 23) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar13}`+" 명");
				}
				else if (d.properties.code == 22) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar14}`+" 명");
				}
				else if (d.properties.code == 21) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar15}`+" 명");
				}
				else if (d.properties.code == 11) {
					tooltip.text(d.properties.name+"\n\n누적확진자 수: "+`${bar16}`+" 명");
				}

				return d.properties.name;
			});



		/*labels = states
			.selectAll('text')
			.data(json.features) //라벨표시
			.enter()
			.append('text')
			.attr('transform', translateTolabel)
			.attr('id', function(d) {
				return 'label-' + d.properties.name_eng;
			})
			.attr('text-anchor', 'middle')
			.attr('dy', '.35em')
			.text(function(d) {
				if (d.properties.code == 39) {
					return `${bar0}`;
				}
				else if (d.properties.code == 38) {
					return `${bar1}`;
				}

				else if (d.properties.code == 37) {
					return `${bar2}`;
				}

				else if (d.properties.code == 36) {
					return `${bar3}`;
				}
				else if (d.properties.code == 35) {
					return `${bar4}`;
				}
				else if (d.properties.code == 34) {
					return `${bar5}`;
				}
				else if (d.properties.code == 33) {
					return `${bar6}`;
				}
				else if (d.properties.code == 32) {
					return `${bar7}`;
				}
				else if (d.properties.code == 31) {
					return `${bar8}`;
				}
				else if (d.properties.code == 29) {
					return `${bar9}`;
				}
				else if (d.properties.code == 26) {
					return `${bar10}`;
				}
				else if (d.properties.code == 25) {
					return `${bar11}`;
				}
				else if (d.properties.code == 24) {
					return `${bar12}`;
				}
				else if (d.properties.code == 23) {
					return `${bar13}`;
				}
				else if (d.properties.code == 22) {
					return `${bar14}`;
				}
				else if (d.properties.code == 21) {
					return `${bar15}`;
				}
				else if (d.properties.code == 11) {
					return `${bar16}`;
				}

				return d.properties.name;
			});
*/
	});



	//텍스트 위치 조절 - 하드코딩으로 위치 조절을 했습니다.
	function translateTolabel(d) {
		var arr = path.centroid(d);
		if (d.properties.code == 31) {
			//서울 경기도 이름 겹쳐서 경기도 내리기

			arr[1] +=
				d3.event && d3.event.scale
					? d3.event.scale / height + 20
					: initialScale / height + 20;
		} else if (d.properties.code == 34) {
			//충남은 조금 더 내리기
			arr[1] +=
				d3.event && d3.event.scale
					? d3.event.scale / height + 10
					: initialScale / height + 10;
		}
		return 'translate(' + arr + ')';
	}
	/*
	function zoom() {
		projection.translate(d3.event.translate).scale(d3.event.scale);
		states.selectAll('path').attr('d', path);
		labels.attr('transform', translateTolabel);
	}*/

	var tooltip = d3.select("body").append("div")
		.attr("class", "toolTip")
		.style("display", "none");
		
	
}
function remove() {
		d3.selectAll('svg').remove();
}