import Quickshell
import QtQuick
import "../../colors/colors-quickshell.js" as Wal

Rectangle {
	id: clock
	implicitWidth: Math.min(text.implicitWidth, 400)
	// implicitHeight: text.implicitHeight 
	implicitHeight: parent.height
	color: Wal.colors.background
	Text {
		id: text
		anchors.centerIn: parent
		text: Time.time
		font.family: "Fira Code"
		font.bold: true
		font.pixelSize: 16
		color: Wal.colors.color2 
	}
}
