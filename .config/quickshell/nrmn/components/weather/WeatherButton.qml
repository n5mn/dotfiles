import Quickshell
import QtQuick
import Qt5Compat.GraphicalEffects
import "../colors-quickshell.js" as Wal
import ".."

BarItem {
	id: weather
	displayText: Weather.weatherText
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
				source: Weather.weatherIcon
				visible: Weather.weatherIcon != ""
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
			// anchors.centerIn: parent
			// width: parent.widthh
			// anchors.right: parent.right
			text: Weather.weatherText
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
	onLeftClicked: console.log("open weather app or some shit")
} 
