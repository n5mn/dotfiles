import Quickshell
import QtQuick
import Qt5Compat.GraphicalEffects
import "../../colors/colors-quickshell.js" as Wal

Rectangle {
	id: weather
	implicitWidth: Math.min(row.implicitWidth, 200)
	// implicitHeight: text.implicitHeight 
	implicitHeight: parent.height
	color: Wal.colors.background
	// color: "red"
	Row {
		id: row
		anchors.centerIn: parent
		Text {
			id: text
			// anchors.centerIn: parent
			// width: parent.width / 2
			text: Weather.weatherText
			font.family: "Fira Code"
			font.bold: true
			font.pixelSize: 16
			color: Wal.colors.color2 
		}


	}
}
