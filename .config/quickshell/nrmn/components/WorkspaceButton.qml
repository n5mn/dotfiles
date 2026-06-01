import Quickshell
import QtQuick
import "../colors/colors-quickshell.js" as Wal

Rectangle {
	id: wsButton

	property color contentColor: Wal.colors.color11
	property color backgroundColor: Qt.rgba(contentColor.r, contentColor.g, contentColor.b, 0.3)
	required property int index
	required property var workspaces // array 5 per screen, ej: [1,2,3,4,5] or [6,7,8,9,10]
	required property bool isFocused

	height: 25
	width: 28
	// implicitWidth: text.implicitWidth + 12
	// implicitHeight: text.implicitHeight + 8
	color: {
		if (mouseArea.containsMouse) {
			return backgroundColor
		}
		if (workspaces === Workspaces.focusedWorkspace()) {
			return backgroundColor
		}
		return Wal.colors.color0
	}

	signal clicked()

	Behavior on color {
		ColorAnimation { duration: 200 }
	}

	Text {
		id: text
		anchors.centerIn: parent
		text: Workspaces.getWorkspaceNames(wsButton.workspaces)
		// color: isFocused ? Wal.colors.background : Wal.colors.color11
		color: isFocused ? Wal.colors.color2 : Wal.colors.color1
		font.family: "JetBrains Mono"
		font.bold: (wsButton.workspaces === Workspaces.focusedWorkspace())
	}

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		onClicked: wsButton.clicked()
	}
}
