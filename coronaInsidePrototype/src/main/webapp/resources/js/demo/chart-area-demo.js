
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

var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: [`${date30}`, `${date29}`, `${date28}`, `${date27}`, `${date26}`, `${date25}`,
			`${date24}`, `${date23}`, `${date22}`, `${date21}`, `${date20}`, `${date19}`, `${date18}`, `${date17}`, `${date16}`, `${date15}`, `${date14}`, `${date13}`,
			`${date12}`, `${date11}`, `${date10}`, `${date9}`, `${date8}`, `${date7}`, `${date6}`, `${date5}`, `${date4}`, `${date3}`, `${date2}`, `${date1}`],
		datasets: [{
			label: "누적확진자 수",
			lineTension: 0.3,
			backgroundColor: "rgba(78, 115, 223, 0.05)",
			borderColor: "#6f42c1",
			pointRadius: 3,
			pointBackgroundColor: "#6f42c1",
			pointBorderColor: "#6f42c1",
			pointHoverRadius: 3,
			
			pointHoverBackgroundColor: "#ffc107",
		
			pointHoverBorderColor: "#ffc107",
			pointHitRadius: 10,
			pointHoverRadius: 6,
			pointBorderWidth: 2,
			data: [`${cnt30}`, `${cnt29}`, `${cnt28}`, `${cnt27}`, `${cnt26}`, `${cnt25}`,
				`${cnt24}`, `${cnt23}`, `${cnt22}`, `${cnt21}`, `${cnt20}`, `${cnt19}`, `${cnt18}`, `${cnt17}`, `${cnt16}`, `${cnt15}`, `${cnt14}`, `${cnt13}`,
				`${cnt12}`, `${cnt11}`, `${cnt10}`, `${cnt9}`, `${cnt8}`, `${cnt7}`, `${cnt6}`, `${cnt5}`, `${cnt4}`, `${cnt3}`, `${cnt2}`, `${cnt1}`],
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
					unit: 'date'
				},
				gridLines: {
					display: false,
					drawBorder: false
				},
				ticks: {
					maxTicksLimit: 5,
					minRotation: 0,		
					maxRotation: 0
				}
			}],
			yAxes: [{
				ticks: {
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
			backgroundColor: "rgb(255,255,255)",
			bodyFontColor: "#858796",
			titleMarginBottom: 10,
			titleFontColor: '#6e707e',
			titleFontSize: 14,
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
