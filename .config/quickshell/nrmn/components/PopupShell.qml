import Quickshell
import QtQuick
import "colors-quickshell.js" as Wal

PopupWindow {
	required property var panelWindow
	required property Component content
	// for more custom shit
	property int iWidth: 300
	property int iHeight: 300
	property string position: "center" // left, center, right

	id: root
	anchor.window: panelWindow
	anchor.rect.x: ({
		"left": 0,
		"center": (panelWindow.width - width) / 2,
		"right": panelWindow.width
	}[root.position]) 

	anchor.rect.y: panelWindow.height + 3
	grabFocus: true // lsp is retarded and says doesnt exist
	implicitWidth: iWidth
	implicitHeight: iHeight
	visible: false
	Rectangle {
		id: background 
		anchors.fill: parent
		color: Wal.colors.background
		border.color: Wal.colors.color11

		Loader {
			sourceComponent: root.content
			anchors.fill: parent
		}
	}
}

