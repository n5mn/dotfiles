import Quickshell
import QtQuick
import ".."
import "../utils"

BarItem {
	property var sh: Sh { command: "" }
	id: power 
	displayText: ""
	relativeWidth: 100
	// TODO: do this with quickshell and qml
	onLeftClicked: sh.exec("wlogout -b 2")
}


