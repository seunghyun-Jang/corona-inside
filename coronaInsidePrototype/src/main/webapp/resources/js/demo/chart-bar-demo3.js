// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
	// *     example: number_format(1234.56, 2, ',', ' ');
	// *     return: '1 234,56'
	number = (number + '').replace(',', '').replace(' ', '');
	var n = !isFinite(+number) ? 0 : +number,
		prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
		sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
		dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
		s = '',
		toFixedFix = function(n, prec) {
			var k = Math.pow(10, prec);
			return '' + Math.round(n * k) / k;
		};
	
	s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
	if (s[0].length > 3) {
		s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
	}
	if ((s[1] || '').length < prec) {
		s[1] = s[1] || '';
		s[1] += new Array(prec - s[1].length + 1).join('0');
	}
	return s.join(dec);
}



var ctx = document.getElementById("myBarChart3");
var myBarChart = new Chart(ctx, {
	type: 'bar',
	data: {
		labels: ["제주", "경남", "경북", "전남", "전북", "충남", "충북", "강원", "경기", "세종", "울산", "대전", "광주", "인천", "대구", "부산", "서울"],
		datasets: [{
			label: "접종률",
			backgroundColor: "#6f42c1",
			hoverBackgroundColor: "#ffc107",
			borderColor: "#4e73df",
			data: [`${oneBar0}`/670000*100, `${oneBar1}`/3340000*100, `${oneBar2}`/2640000*100, `${oneBar3}`/1850000*100, `${oneBar4}`/1800000*100, `${oneBar5}`/2120000*100, `${oneBar6}`/1600000*100, 
			`${oneBar7}`/1650000*100, `${oneBar8}`/13430000*100, `${oneBar9}`/360000*100, `${oneBar10}`/1140000*100, `${oneBar11}`/1460000*100, `${oneBar12}`/1450000*100, 
			`${oneBar13}`/2940000*100, `${oneBar14}`/2420000*100, `${oneBar15}`/3390000*100, `${oneBar16}`/9670000*100],
		}],
	},
	options: {
		maintainAspectRatio: false,
		layout: {
			padding: {
				left: 10,
				right: 25,
				top: 25,
				bottom: 0
			}
		},
		scales: {
			xAxes: [{
				time: {
					unit: 'month'
				},
				gridLines: {
					display: false,
					drawBorder: false
				},
				ticks: {
					maxTicksLimit: 30,
					interval: 50,
					autoSkip: false,		
					minRotation: 0,		
					maxRotation: 0,
					fontSize: 10

				},
				maxBarThickness: 25,
			}],
			yAxes: [{
				ticks: {
					min: 0,
					max: 100,
					maxTicksLimit: 5,
					padding: 10,
				
					callback: function(value, index, values) {
						
						return number_format(value) + ' %';
					}
				},
				gridLines: {
					color: "rgb(234, 236, 244)",
					zeroLineColor: "rgb(234, 236, 244)",
					drawBorder: false,
					borderDash: [2],
					zeroLineBorderDash: [2]
				}
			}],
		},
		legend: {
			display: false
		},
		tooltips: {
			titleMarginBottom: 10,
			titleFontColor: '#6e707e',
			titleFontSize: 14,
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			borderColor: '#dddfeb',
			borderWidth: 1,
			xPadding: 15,
			yPadding: 15,
			displayColors: false,
			intersect: false,
			mode: 'index',      
			caretPadding: 10,
			callbacks: {
				label: function(tooltipItem, chart) {
					var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
					
					return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' %';
				}
			}
		},
		hover: {
			mode: 'index',
			intersect: false
		},
	}
});


function updateChartType1(bt) {
				myBarChart.destroy();
                
				myBarChart = new Chart(ctx, {
	type: 'bar',
	data: {
		labels: ["제주", "경남", "경북", "전남", "전북", "충남", "충북", "강원", "경기", "세종", "울산", "대전", "광주", "인천", "대구", "부산", "서울"],
		datasets: [{
			label: "접종률",
			backgroundColor: "#6f42c1",
			hoverBackgroundColor: "#ffc107",
			borderColor: "#4e73df",
			data: [`${oneBar0}`/670000*100, `${oneBar1}`/3340000*100, `${oneBar2}`/2640000*100, `${oneBar3}`/1850000*100, `${oneBar4}`/1800000*100, `${oneBar5}`/2120000*100, `${oneBar6}`/1600000*100, 
			`${oneBar7}`/1650000*100, `${oneBar8}`/13430000*100, `${oneBar9}`/360000*100, `${oneBar10}`/1140000*100, `${oneBar11}`/1460000*100, `${oneBar12}`/1450000*100, 
			`${oneBar13}`/2940000*100, `${oneBar14}`/2420000*100, `${oneBar15}`/3390000*100, `${oneBar16}`/9670000*100],
		}],
	},
	options: {
		maintainAspectRatio: false,
		layout: {
			padding: {
				left: 10,
				right: 25,
				top: 25,
				bottom: 0
			}
		},
		scales: {
			xAxes: [{
				time: {
					unit: 'month'
				},
				gridLines: {
					display: false,
					drawBorder: false
				},
				ticks: {
					maxTicksLimit: 30,
					interval: 50,
					autoSkip: false,		
					minRotation: 0,		
					maxRotation: 0,
					fontSize: 10

				},
				maxBarThickness: 25,
			}],
			yAxes: [{
				ticks: {
					min: 0,
					max: 100,
					maxTicksLimit: 5,
					padding: 10,
					
					callback: function(value, index, values) {
						
						return number_format(value) + ' %';
					}
				},
				gridLines: {
					color: "rgb(234, 236, 244)",
					zeroLineColor: "rgb(234, 236, 244)",
					drawBorder: false,
					borderDash: [2],
					zeroLineBorderDash: [2]
				}
			}],
		},
		legend: {
			display: false
		},
		tooltips: {
			titleMarginBottom: 10,
			titleFontColor: '#6e707e',
			titleFontSize: 14,
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			borderColor: '#dddfeb',
			borderWidth: 1,
			xPadding: 15,
			yPadding: 15,
			displayColors: false,
			intersect: false,
			mode: 'index',      
			caretPadding: 10,
			callbacks: {
				label: function(tooltipItem, chart) {
					var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
					
					return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' %';
				}
			}
		},
		hover: {
			mode: 'index',
			intersect: false
		},
	}
});

}

function updateChartType2(bt) {
		
                
				myBarChart.destroy();
                
				myBarChart = new Chart(ctx, {
	type: 'bar',
	data: {
		labels: ["제주", "경남", "경북", "전남", "전북", "충남", "충북", "강원", "경기", "세종", "울산", "대전", "광주", "인천", "대구", "부산", "서울"],
		datasets: [{
			label: "접종률",
			backgroundColor: "#6f42c1",
			hoverBackgroundColor: "#ffc107",
			borderColor: "#4e73df",
			data: [`${twoBar0}`/670000*100, `${twoBar1}`/3340000*100, `${twoBar2}`/2640000*100, `${twoBar3}`/1850000*100, `${twoBar4}`/1800000*100, `${twoBar5}`/2120000*100, `${twoBar6}`/1600000*100, 
			`${twoBar7}`/1650000*100, `${twoBar8}`/13430000*100, `${twoBar9}`/360000*100, `${twoBar10}`/1140000*100, `${twoBar11}`/1460000*100, `${twoBar12}`/1450000*100, 
			`${twoBar13}`/2940000*100, `${twoBar14}`/2420000*100, `${twoBar15}`/3390000*100, `${twoBar16}`/9670000*100],
		}],
	},
	options: {
		maintainAspectRatio: false,
		layout: {
			padding: {
				left: 10,
				right: 25,
				top: 25,
				bottom: 0
			}
		},
		scales: {
			xAxes: [{
				time: {
					unit: 'month'
				},
				gridLines: {
					display: false,
					drawBorder: false
				},
				ticks: {
					maxTicksLimit: 30,
					interval: 50,
					autoSkip: false,		
					minRotation: 0,		
					maxRotation: 0,
					fontSize: 10

				},
				maxBarThickness: 25,
			}],
			yAxes: [{
				ticks: {
					min: 0,
					max: 100,
					maxTicksLimit: 5,
					padding: 10,
					
					callback: function(value, index, values) {
						
						return number_format(value) + ' %';
					}
				},
				gridLines: {
					color: "rgb(234, 236, 244)",
					zeroLineColor: "rgb(234, 236, 244)",
					drawBorder: false,
					borderDash: [2],
					zeroLineBorderDash: [2]
				}
			}],
		},
		legend: {
			display: false
		},
		tooltips: {
			titleMarginBottom: 10,
			titleFontColor: '#6e707e',
			titleFontSize: 14,
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			borderColor: '#dddfeb',
			borderWidth: 1,
			xPadding: 15,
			yPadding: 15,
			displayColors: false,
			intersect: false,
			mode: 'index',      
			caretPadding: 10,
			callbacks: {
				label: function(tooltipItem, chart) {
					var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
					
					return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' %';
				}
			}
		},
		hover: {
			mode: 'index',
			intersect: false
		},
	}
});

}
