import Quickshell
import QtQuick
import ".."

BarItem {
	property bool showFull: false
  property string date: Qt.formatDateTime(clock.date, "hh:mm |")
	property string fullDate: Qt.formatDateTime(clock.date, "dddd, dd/MM hh:mm |")
	id: root 
	displayText: showFull ? fullDate : date
	relativeWidth: 400
	
  SystemClock {
    id: clock 
    precision: SystemClock.Seconds
  }
	onLeftClicked: showFull = !showFull
	//
	onRightClicked:	console.log("right click")
}

