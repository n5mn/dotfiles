import Quickshell
import QtQuick
import "../colors-quickshell.js" as Wal
import "../notifications"

Rectangle {
	property var notificationRef
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
	signal clicked()
	MouseArea {
		anchors.fill: parent
		onClicked: console.log("open calendar or some shit")
		// onClicked: notificationRef?.toggle()
	}
}
