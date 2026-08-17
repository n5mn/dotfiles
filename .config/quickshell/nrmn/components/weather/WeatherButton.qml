import Quickshell
import QtQuick
import Qt5Compat.GraphicalEffects
import "../colors-quickshell.js" as Wal
import ".."
import "../utils"

BarItem {
	id: weather
	displayText: WeatherService.currentTemperature + WeatherService.currentTemperatureUnits
	relativeWidth: 300
	content: Row {
		id: row
		anchors.centerIn: parent
		spacing: 10
		Item {
			width: parent.width * 0.15
			height: parent.height
			// anchors.left: parent.left
			Image {
				id: icon
				source: WeatherService.icon
				visible: WeatherService.icon != ""
				height: parent.height
				fillMode: Image.PreserveAspectFit
			}
			ColorOverlay {
				anchors.fill: icon
				source: icon
				scale: 1.0
				color: Wal.colors.color10
			}
		}
		Text {
			id: text
			text: WeatherService.currentTemperature + WeatherService.currentTemperatureUnits
			font.family: "Fira Code"
			font.bold: true
			font.pixelSize: 16

			color: {
				// isHovered is a property of BarItem
				if (isHovered) {
					return Wal.colors.color4
				}
				return Wal.colors.color2
			}

			Behavior on color {
				ColorAnimation { duration: 200 }
			}
		}
	}
	onLeftClicked: Sh.exec("xdg-open https://weather.com/weather/today/l/cb0b09b804fbcfb93b3485607c771c23607ce00484606431defb3c0cd10efb79?unit=m")
} 
