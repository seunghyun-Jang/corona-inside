
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
	
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



var ctx = document.getElementById("myBarChart2");
if(ctx!=null) {
var myBarChart = new Chart(ctx, {
	type: 'bar',
	data: {
		
		labels: [`${date7}`, `${date6}`, `${date5}`, `${date4}`, `${date3}`, `${date2}`, `${date1}`],
		datasets: [{
			label: "일일 확진자 수",
			backgroundColor: "#6f42c1",
			hoverBackgroundColor: "#ffc107",
			borderColor: "#4e73df",
			data: [`${cnt6}`-`${cnt7}`, `${cnt5}`-`${cnt6}`, `${cnt4}`-`${cnt5}`, `${cnt3}`-`${cnt4}`, `${cnt2}`-`${cnt3}`, `${cnt1}`-`${cnt2}`, `${cnt0}`-`${cnt1}`],
		}],
	},
	options: {
		maintainAspectRatio: false,
		layout: {
			padding: {
				left: 0,
				right: 0,
				top: 0,
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
					
					maxTicksLimit: 5,
					padding: 10,
					
					callback: function(value, index, values) {
						
						return number_format(value) + ' 명';
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
					
					return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' 명';
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


function updateChartType1() {
                
				myBarChart.destroy();
                
				myBarChart = new Chart(ctx, {
	type: 'bar',
	data: {
		
		labels: [`${date7}`, `${date6}`, `${date5}`, `${date4}`, `${date3}`, `${date2}`, `${date1}`],
		datasets: [{
			label: "일일 확진자 수",
			backgroundColor: "#6f42c1",
			hoverBackgroundColor: "#ffc107",
			borderColor: "#4e73df",
			data: [`${cnt6}`-`${cnt7}`, `${cnt5}`-`${cnt6}`, `${cnt4}`-`${cnt5}`, `${cnt3}`-`${cnt4}`, `${cnt2}`-`${cnt3}`, `${cnt1}`-`${cnt2}`, `${cnt0}`-`${cnt1}`],
		}],
	},
	options: {
		maintainAspectRatio: false,
		layout: {
			padding: {
				left: 0,
				right: 0,
				top: 0,
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
					
					maxTicksLimit: 5,
					padding: 10,
					
					callback: function(value, index, values) {
						
						return number_format(value) + ' 명';
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
					
					return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' 명';
				}
			}
		},
		hover: {
			mode: 'index',
			intersect: false
		},
	}
});
};

function updateChartType2() {
                
				myBarChart.destroy();
                
				myBarChart = new Chart(ctx, {
	type: 'bar',
	data: {
		
		labels: [`${date14}`, `${date13}`, `${date12}`, `${date11}`, `${date10}`, `${date9}`, `${date8}`, `${date7}`, `${date6}`, `${date5}`, `${date4}`, `${date3}`, `${date2}`, `${date1}`],
		datasets: [{
			label: "일일 확진자 수",
			backgroundColor: "#6f42c1",
			hoverBackgroundColor: "#ffc107",
			borderColor: "#4e73df",
			data: [`${cnt13}`-`${cnt14}`, `${cnt12}`-`${cnt13}`, `${cnt11}`-`${cnt12}`, `${cnt10}`-`${cnt11}`, `${cnt9}`-`${cnt10}`, `${cnt8}`-`${cnt9}`, `${cnt7}`-`${cnt8}`, `${cnt6}`-`${cnt7}`, `${cnt5}`-`${cnt6}`, `${cnt4}`-`${cnt5}`, `${cnt3}`-`${cnt4}`, `${cnt2}`-`${cnt3}`, `${cnt1}`-`${cnt2}`, `${cnt0}`-`${cnt1}`],
		}],
	},
	options: {
		maintainAspectRatio: false,
		layout: {
			padding: {
				left: 0,
				right: 0,
				top: 0,
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
					maxTicksLimit: 10,
					interval: 50,
					autoSkip: true,		
					minRotation: 0,		
					maxRotation: 0,
					fontSize: 10

				},
				maxBarThickness: 25,
			}],
			yAxes: [{
				ticks: {
					min: 0,
					
					maxTicksLimit: 5,
					padding: 10,
					
					callback: function(value, index, values) {
						
						return number_format(value) + ' 명';
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
					
					return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' 명';
				}
			}
		},
		hover: {
			mode: 'index',
			intersect: false
		},
	}
});
};

function updateChartType3() {
                
				myBarChart.destroy();
                
				myBarChart = new Chart(ctx, {
	type: 'bar',
	data: {
		
		labels: [`${date30}`, `${date29}`, `${date28}`, `${date27}`, `${date26}`, `${date25}`,
			`${date24}`, `${date23}`, `${date22}`, `${date21}`, `${date20}`, `${date19}`, `${date18}`, `${date17}`, `${date16}`, `${date15}`, `${date14}`, `${date13}`,
			`${date12}`, `${date11}`, `${date10}`, `${date9}`, `${date8}`, `${date7}`, `${date6}`, `${date5}`, `${date4}`, `${date3}`, `${date2}`, `${date1}`],
		datasets: [{
			label: "일일 확진자 수",
			backgroundColor: "#6f42c1",
			hoverBackgroundColor: "#ffc107",
			borderColor: "#4e73df",
			data: [`${cnt29}`-`${cnt30}`, `${cnt28}`-`${cnt29}`, `${cnt27}`-`${cnt28}`, `${cnt26}`-`${cnt27}`, `${cnt25}`-`${cnt26}`, `${cnt24}`-`${cnt25}`,
				`${cnt23}`-`${cnt24}`, `${cnt22}`-`${cnt23}`, `${cnt21}`-`${cnt22}`, `${cnt20}`-`${cnt21}`, `${cnt19}`-`${cnt20}`, `${cnt18}`-`${cnt19}`, `${cnt17}`-`${cnt18}`, `${cnt16}`-`${cnt17}`, `${cnt15}`-`${cnt16}`, `${cnt14}`-`${cnt15}`, `${cnt13}`-`${cnt14}`, `${cnt12}`-`${cnt13}`,
				`${cnt11}`-`${cnt12}`, `${cnt10}`-`${cnt11}`, `${cnt9}`-`${cnt10}`, `${cnt8}`-`${cnt9}`, `${cnt7}`-`${cnt8}`, `${cnt6}`-`${cnt7}`, `${cnt5}`-`${cnt6}`, `${cnt4}`-`${cnt5}`, `${cnt3}`-`${cnt4}`, `${cnt2}`-`${cnt3}`, `${cnt1}`-`${cnt2}`, `${cnt0}`-`${cnt1}`],
		}],
	},
	options: {
		maintainAspectRatio: false,
		layout: {
			padding: {
				left: 0,
				right: 0,
				top: 0,
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
					maxTicksLimit: 10,
					interval: 50,
					autoSkip: true,		
					minRotation: 0,		
					maxRotation: 0,
					fontSize: 10

				},
				maxBarThickness: 25,
			}],
			yAxes: [{
				ticks: {
					min: 0,
					
					maxTicksLimit: 5,
					padding: 10,
					
					callback: function(value, index, values) {
						
						return number_format(value) + ' 명';
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
					
					return datasetLabel + ': ' + number_format(tooltipItem.yLabel) + ' 명';
				}
			}
		},
		hover: {
			mode: 'index',
			intersect: false
		},
	}
});
};