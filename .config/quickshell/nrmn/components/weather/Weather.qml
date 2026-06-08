pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: weather
	property string weatherText
	property string weatherIcon: ""

	function getWeather() {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE) {
				let data = JSON.parse(xhr.responseText.toString());
				// weather.weatherText = xhr.responseText.toString();
				let temperature = data.current_condition[0].temp_C
				// let condition = data.current_condition[0].weatherDesc[0].value // i can do a map for this icons
				let icon = data.current_condition[0].weatherIconUrl[0].value

				weather.weatherIcon = icon
				weather.weatherText = temperature + "°C"

				console.log(temperature)
				// console.log(condition)
				console.log(icon)
			}
		}
		// xhr.open("GET", "http://wttr.in/?format=%t")
		xhr.open("GET", "http://wttr.in/?format=j2")
		xhr.setRequestHeader("User-Agent", "curl/7.68.0")
		xhr.send();
	}

	Timer {
		interval: 60*60*1000
		repeat: true
		running: true
		onTriggered: weather.getWeather()
	}
	Component.onCompleted: getWeather()
}
