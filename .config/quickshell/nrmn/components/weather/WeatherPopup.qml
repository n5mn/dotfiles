import Quickshell
import QtQuick
import QtQuick.Layouts
import ".."
import "../colors-quickshell.js" as Wal


PopupShell {
	position: "left"
	iHeight: 250
	iWidth: 350

	component WeatherInfo: Text {
		font.family: "Fira Code"
		font.pixelSize: 16
		font.bold: true
		color: Wal.colors.color2
		horizontalAlignment: Text.AlignHCenter
		Layout.fillWidth: true
	}

	content: ColumnLayout {
		WeatherInfo {
			text: "Feels like: " + WeatherService.apparentTemperature + WeatherService.apparentTemperatureUnits
			font.pixelSize: 20
			color: Wal.colors.color14
		}	
		WeatherInfo {
			text: " " + WeatherService.minTemperature + "  -   " + WeatherService.maxTemperature 
		}

		WeatherInfo {
			text: " Humidity: " + WeatherService.relativeHumidity + WeatherService.relativeHumidityUnits
		}	
		WeatherInfo {
			text: "󰖗 Rain chance: " + WeatherService.precipitationProbability + WeatherService.precipitationProbabilityUnits
		}	
		WeatherInfo {
			text: "󰖗 Rain: " + WeatherService.precipitation + WeatherService.precipitationUnits 
		}	
		WeatherInfo {
			text: " Wind speed: " + WeatherService.windSpeed + WeatherService.windSpeedUnits
		}

	}
}
