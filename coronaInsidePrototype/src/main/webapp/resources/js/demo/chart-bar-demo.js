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
	// Fix for IE parseFloat(0.55).toFixed(0) = 0;
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

// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myBarChart = new Chart(ctx, {
	type: 'horizontalBar',
	data: {
		labels: ["제주", "경남", "경북", "전남", "전북", "충남", "충북", "강원", "경기", "세종", "울산", "대전", "광주", "인천", "대구", "부산", "서울"],
		datasets: [{
			label: "누적확진자 수",
			backgroundColor: "#6f42c1",
			hoverBackgroundColor: "#ffc107",
			borderColor: "#4e73df",
			data: [`${bar0}`, `${bar1}`, `${bar2}`, `${bar3}`, `${bar4}`, `${bar5}`, `${bar6}`, `${bar7}`, `${bar8}`, `${bar9}`, `${bar10}`, `${bar11}`, `${bar12}`, `${bar13}`, `${bar14}`, `${bar15}`, `${bar16}`],
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
			yAxes: [{
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
					autoSkip: false,		// 모든 label을 표시하기 위함maxRotation: 0,
					minRotation: 0,		// 모든 label이 회전하는걸 막기위함.
					maxRotation: 0,
					fontSize: 10

				},
				maxBarThickness: 25,
			}],
			xAxes: [{
				ticks: {
					min: 0,
					//max: 30000,
					maxTicksLimit: 5,
					padding: 10,
					// Include a dollar sign in the ticks
					callback: function(value, index, values) {
						//return '$' + number_format(value);
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
			intersect: false,// 추가한것.  근처에만 커서를 가져가도 툴팁이 보이도록 한다.
			mode: 'index',//	""	      
			caretPadding: 10,
			callbacks: {
				label: function(tooltipItem, chart) {
					var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
					//return datasetLabel + ': $' + number_format(tooltipItem.xLabel);
					return datasetLabel + ': ' + number_format(tooltipItem.xLabel) + ' 명';
				}
			}
		},
		hover: {
			mode: 'index',
			intersect: false
		},
	}
});
