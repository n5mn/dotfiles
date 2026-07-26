pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: weather
	readonly property string weatherText: WeatherService.currentTemperature + WeatherService.units // "°C"
	readonly property string weatherIcon: WeatherService.icon

	property var location: []

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
