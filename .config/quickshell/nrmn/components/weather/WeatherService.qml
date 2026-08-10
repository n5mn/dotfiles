pragma Singleton

import Quickshell
import QtQuick
import "./WeatherCodes.js" as WeatherCodes

Singleton {

	property var location: []
	property string currentTemperature: "--"
	property string units: "°C"
	property string icon: ""

	function refresh() {
		getWeather()
	}
	function start() {
		getLocation(getWeather)
	}

	function getLocation(callback) {
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE) {
				let data = JSON.parse(xhr.responseText.toString());
				location = data.loc.split(",")
				if (callback) callback()
			}
		}
		xhr.open("GET", "http://ipinfo.io/json")
		xhr.setRequestHeader("User-Agent", "curl/7.68.0")
		xhr.send();
	}

	function getWeather() {
		if (!location.length) return 
		let url = "http://api.open-meteo.com/v1/forecast?latitude=" + location[0] + "&longitude=" + location[1] + "&current=temperature_2m,weather_code,is_day"
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE) {
				let data = JSON.parse(xhr.responseText.toString());
				let weatherCode = data.current.weather_code
				let isDay = data.current.is_day

				icon = getIcon(weatherCode, isDay)
				currentTemperature = data.current.temperature_2m
				units = data.current_units.temperature_2m
				// console.log(getIcon(weatherCode, isDay))
				// console.log(weatherCode)
				// console.log(isDay)

			}
		}
		xhr.open("GET", url)
		xhr.setRequestHeader("User-Agent", "curl/7.68.0")
		xhr.send();
	}

	function getIcon(code, isDay) {
		const weather = WeatherCodes.codes[code]
		if (!weather) {
			return ""
		}
		if (isDay === 0 ) {
			return weather.night
		} else {
			return weather.day
		}
	}
}
