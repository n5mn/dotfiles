pragma Singleton

import Quickshell
import QtQuick
import "./WeatherCodes.js" as WeatherCodes

Singleton {

	property var location: []
	property string currentTemperature: "--"
	property string currentTemperatureUnits: "°C"
	property string icon: ""

	// for the popup
	property string minTemperature
	property string maxTemperature
	property string precipitation
	property string precipitationUnits
	property string precipitationProbability
	property string precipitationProbabilityUnits
	property string relativeHumidity
	property string relativeHumidityUnits
	property string apparentTemperature
	property string apparentTemperatureUnits
	property string windSpeed
	property string windSpeedUnits

	id: weatherService

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
		xhr.open("GET", "https://ipinfo.io/json")
		xhr.setRequestHeader("User-Agent", "curl/7.68.0")
		xhr.send();
	}

	function getWeather() {
		if (!location.length) return 
		let url = "https://api.open-meteo.com/v1/forecast?latitude=" + location[0] + "&longitude=" + location[1] + "&current=temperature_2m,weather_code,is_day,precipitation,precipitation_probability,relative_humidity_2m,apparent_temperature,wind_speed_10m&daily=temperature_2m_max,temperature_2m_min&forecast_days=1"
		let xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE) {
				let data = JSON.parse(xhr.responseText.toString());
				let weatherCode = data.current.weather_code
				let isDay = data.current.is_day

				icon = getIcon(weatherCode, isDay)
				currentTemperature = data.current.temperature_2m
				currentTemperatureUnits = data.current_units.temperature_2m
				// shit needed for the popup 
				minTemperature = data.daily.temperature_2m_min[0]
				maxTemperature = data.daily.temperature_2m_max[0]
				precipitation = data.current.precipitation
				precipitationUnits = data.current_units.precipitation
				precipitationProbability = data.current.precipitation_probability
				precipitationProbabilityUnits = data.current_units.precipitation_probability
				relativeHumidity = data.current.relative_humidity_2m
				relativeHumidityUnits = data.current_units.relative_humidity_2m
				apparentTemperature = data.current.apparent_temperature
				apparentTemperatureUnits = data.current_units.apparent_temperature
				windSpeed = data.current.wind_speed_10m
				windSpeedUnits = data.current_units.wind_speed_10m
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

	Timer {
		interval: 30 * 60 * 1000
		repeat: true
		running: true
		onTriggered: WeatherService.refresh()
	}

	Component.onCompleted: {
		WeatherService.start()
	}
}
