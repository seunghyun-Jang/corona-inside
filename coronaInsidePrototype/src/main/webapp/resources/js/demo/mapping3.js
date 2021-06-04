function drawMap(target) {
	var width = 700; 
	var height = 700; 
	var initialScale = 5500; 
	var initialX = -11900; 
	var initialY = 4050; 
	var labels;



	var projection = d3.geo
		.mercator()
		.scale(initialScale)
		.translate([initialX, initialY]);
	var path = d3.geo.path().projection(projection);
	
	
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
		

	states
		.append('rect')
		.attr('class', 'background')
		.attr('width', width + 'px')
		.attr('height', height + 'px')
		

	
	d3.json('resources/json/korea.json', function(json) {
		states
			.selectAll('path') 
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

	});


	var tooltip = d3.select("body").append("div")
		.attr("class", "toolTip")
		.style("display", "none");
		
	
}
function remove() {
		d3.selectAll('svg').remove();
}