function displayWeather(obj)
{
	obj = {
		"last_update": "May 10, 2014 09:00 PM",
		"source": "www.Weather-Manila.com (soon to be WISE Program that will run in an IBM supercomputer)",
		"location": "Manila",
		"lat": 14.597,
		"lng": 120.985,
		"icon": "http://nababaha.appspot.com/static/img/34.png",
		"data": [
			{
			"date": "May 10, 2014",
			"rainfall": "0",
			"real_feel": "30",
			"temperature": "27",
			"time": "12:00AM-03:00AM",
			"windspeed": "0",
			"relative_hum": "78",
			"wind_dir": "NE",
			"icon": "http://nababaha.appspot.com/static/img/34.png"
			},
			{
			"date": "May 10, 2014",
			"rainfall": "0",
			"real_feel": "30",
			"temperature": "27",
			"time": "12:00AM-03:00AM",
			"windspeed": "0",
			"relative_hum": "78",
			"wind_dir": "NE",
			"icon": "http://nababaha.appspot.com/static/img/34.png"
			},
			{
			"date": "May 10, 2014",
			"rainfall": "0",
			"real_feel": "30",
			"temperature": "27",
			"time": "12:00AM-03:00AM",
			"windspeed": "0",
			"relative_hum": "78",
			"wind_dir": "NE",
			"icon": "http://nababaha.appspot.com/static/img/34.png"
			}
		]	
	}

	var 	html = drawWeatherIcons(obj) + drawWeatherText(obj);

	jQuery('#weather').html(html);
}

function drawWeatherIcons(obj) {
	var html = '<div class="icons  col-lg-12">' +
							'<div class="col-lg-4">' +
	                    	'<img src="' + obj.icon + '" width="120"/>' +
							'</div><div class="  col-lg-8">' +
							'<p>Location : ' + obj.location + '<p>' +
							'<p>Latitude : ' + obj.lat + '<p>' +
							'<p>Longtitude : ' + obj.lng + '<p>' +
							'<p>Source Info : ' + obj.source + '<p>' +
							'<p>Last Update : ' + obj.last_update + '<p>' +
                    	'</div></div>';

	return html;
}

function drawWeatherText(obj) {
	console.log(obj);
	var html = '<div class="text  col-lg-12"><div class="row">';

	jQuery.each(obj.data, function(key, item) {
		html += '<div class="col-lg-4">' +
                	'<img src="' + item.icon + '" width="100" />' +
							'<p>Windspeed : ' + item.windspeed + '<p>' +
							'<p>Temperature : ' + item.temperature + '&deg C<p>' +
							'<p>Date : ' + item.date + '<p>' +
							'<p>Time : ' + item.time + '<p>' +
					'</div>'
		

	});
	html += '</div></div>';

	return html;
}

