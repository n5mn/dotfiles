import Quickshell
import QtQuick
// import Quickshell.Services.Notifications
import ".."
import "../utils"

BarItem {
	property var sh: Sh { command: "" }
	id: notifications
	displayText: ""
	relativeWidth: 100
	// TODO: use the notification service 
	// import Quickshell.Services.Notifications
	onLeftClicked: sh.exec("dunstctl history-pop")
	onRightClicked: sh.exec("dunstctl set-paused toggle")
}


