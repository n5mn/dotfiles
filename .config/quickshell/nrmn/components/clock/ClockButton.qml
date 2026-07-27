import Quickshell
import QtQuick
import ".."

BarItem {
	id: clock
	displayText: Time.date
	relativeWidth: 400
	// onLeftClicked: console.log("left click")
	onLeftClicked: displayText = displayText === Time.date ? Time.fullDate : Time.date
	onRightClicked:	console.log("right click")
	
}

