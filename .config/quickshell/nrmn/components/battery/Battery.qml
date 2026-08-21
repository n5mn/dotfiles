import Quickshell
import QtQuick
import Quickshell.Services.UPower
import ".." // import BarItem
import "../colors-quickshell.js" as Wal

BarItem {
	property int batteryPercentage: UPower.devices.values[0].percentage * 100
	property var icons: [" ", " ", " ", " ", " "]
	id: root
	relativeWidth: 400
	displayText: icons[Math.floor(batteryPercentage / 20)] + batteryPercentage + "%"
}
