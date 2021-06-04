function drawMap2(target) {
	var width = 700; 
	var height = 700; 
	var initialScale = 5500; 
	var initialX = -11900; 
	var initialY = 4050; 
	var labels;

 

	var data = [`${sd0}`, `${sd1}`, `${sd2}`, `${sd3}`, `${sd4}`,
	`${sd5}`, `${sd6}`, `${sd7}`, `${sd8}`, `${sd9}`,
	`${sd10}`, `${sd11}`, `${sd12}`, `${sd13}`, `${sd14}`,
	`${sd15}`, `${sd16}`];


	

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

	var states2 = svg
		.append('g')
		.attr('id', 'states');
		

	states2
		.append('rect')
		.attr('class', 'background')
		.attr('width', width + 'px')
		.attr('height', height + 'px')
		
		
	function color(d) {
		if(d==0) {
			return "#FFFFFF";
		}else if(d==1) {
			return "#F5A9A9";
		}else if(d==1.5) {
			return "#FA5858";
		}else if(d==2.0) {
			return "#DF0101";
		}else if(d==2.5) {
			return "#8A0808";
		}else if(d==3.0) {
			return "#3B0B0B";
		}
		
	}
	

	d3.json('resources/json/korea.json', function(json) {
		states2
			.selectAll('path') 
			.data(json.features)
			.enter()
			.append('path')
			.attr('d', path)
			.attr('id', function(d) {
				return 'path-' + d.properties.name_eng;
			})
			.on("mouseover", function() {
				tooltip.style("display", null);
			})
			.on("mouseout", function() { 
				tooltip.style("display", "none"); })
			.on("mousemove", function(d) {
				tooltip.style("left", (d3.event.pageX + 10) + "px");
				tooltip.style("top", (d3.event.pageY - 10) + "px");

				if (d.properties.code == 39) {
					tooltip.text(d.properties.name + "\n\n" + `${sd16}`+" 단계");
				}
				else if (d.properties.code == 38) {
					tooltip.text(d.properties.name + "\n\n" + `${sd15}`+" 단계");
				}
				else if (d.properties.code == 37) {
					tooltip.text(d.properties.name + "\n\n" + `${sd14}`+" 단계");
				}
				else if (d.properties.code == 36) {
					tooltip.text(d.properties.name + "\n\n" + `${sd13}`+" 단계");
				}
				else if (d.properties.code == 35) {
					tooltip.text(d.properties.name + "\n\n" + `${sd12}`+" 단계");
				}
				else if (d.properties.code == 34) {
					tooltip.text(d.properties.name + "\n\n" + `${sd11}`+" 단계");
				}
				else if (d.properties.code == 33) {
					tooltip.text(d.properties.name + "\n\n" + `${sd10}`+" 단계");
				}
				else if (d.properties.code == 32) {
					tooltip.text(d.properties.name + "\n\n" + `${sd9}`+" 단계");
				}
				else if (d.properties.code == 31) {
					tooltip.text(d.properties.name + "\n\n" + `${sd8}`+" 단계");
				}
				else if (d.properties.code == 29) {
					tooltip.text(d.properties.name + "\n\n" + `${sd7}`+" 단계");
				}
				else if (d.properties.code == 26) {
					tooltip.text(d.properties.name + "\n\n" + `${sd6}`+" 단계");
				}
				else if (d.properties.code == 25) {
					tooltip.text(d.properties.name + "\n\n" + `${sd5}`+" 단계");
				}
				else if (d.properties.code == 24) {
					tooltip.text(d.properties.name + "\n\n" + `${sd4}`+" 단계");
				}
				else if (d.properties.code == 23) {
					tooltip.text(d.properties.name + "\n\n" + `${sd3}`+" 단계");
				}
				else if (d.properties.code == 22) {
					tooltip.text(d.properties.name + "\n\n" + `${sd2}`+" 단계");
				}
				else if (d.properties.code == 21) {
					tooltip.text(d.properties.name + "\n\n" + `${sd1}`+" 단계");
				}
				else if (d.properties.code == 11) {
					tooltip.text(d.properties.name + "\n\n" + `${sd0}`+"단계");
				}

				return d.properties.name;
			})
			.style("fill", function(d){
				if (d.properties.code == 39) {
					return color(data[16]);
				}
				else if (d.properties.code == 38) {
					return color(data[15]);
				}
				else if (d.properties.code == 37) {
					return color(data[14]);
				}
				else if (d.properties.code == 36) {
					return color(data[13]);
				}
				else if (d.properties.code == 35) {
					return color(data[12]);
				}
				else if (d.properties.code == 34) {
					return color(data[11]);
				}
				else if (d.properties.code == 33) {
					return color(data[10]);
				}
				else if (d.properties.code == 32) {
					return color(data[9]);
				}
				else if (d.properties.code == 31) {
					return color(data[8]);
				}
				else if (d.properties.code == 29) {
					return color(data[7]);
				}
				else if (d.properties.code == 26) {
					return color(data[6]);
				}
				else if (d.properties.code == 25) {
					return color(data[5]);
				}
				else if (d.properties.code == 24) {
					return color(data[4]);
				}
				else if (d.properties.code == 23) {
					return color(data[3]);
				}
				else if (d.properties.code == 22) {
					return color(data[2]);
				}
				else if (d.properties.code == 21) {
					return color(data[1]);
				}
				else if (d.properties.code == 11) {
					return color(data[0]);
				}
				
			});

	});

	var tooltip = d3.select("body").append("div")
		.attr("class", "toolTip2")
		.style("display", "none");
		
	function setColor1() {
		var property = document.getElementById("btn1");
		property.style.backgroundColor = "#FFFFFF";
	}


	function setColor2() {
		var property = document.getElementById("btn2");
		property.style.backgroundColor = "#FFFFFF";
	}
	

}