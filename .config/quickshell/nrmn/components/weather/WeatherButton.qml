import Quickshell
import QtQuick
import Qt5Compat.GraphicalEffects
import "../colors-quickshell.js" as Wal

Rectangle {

	id: weather
	implicitWidth: Math.min(row.implicitWidth, 200)
	implicitHeight: parent.height
	color: Wal.colors.background
	// color: "red"
	Row {
		id: row
		anchors.centerIn: parent
		spacing: 10
		Item {
			width: parent.width * 0.20
			height: parent.height
			// anchors.left: parent.left
			Image {
				id: icon
				source: Weather.weatherIcon
				visible: Weather.weatherIcon != ""
				// width: parent.width
				height: parent.height
				fillMode: Image.PreserveAspectFit
				// opacity: 0.1
			}
			ColorOverlay {
				anchors.fill: icon
				source: icon
				scale: 1.2
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
			color: Wal.colors.color2 

		}
	}

	signal clicked()
	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		onClicked: console.log("open weather app or some shit")

	}
}
