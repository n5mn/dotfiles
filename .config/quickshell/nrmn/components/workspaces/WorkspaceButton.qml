import Quickshell
import QtQuick
import "../colors-quickshell.js" as Wal

Rectangle {
	id: wsButton

	property color contentColor: Wal.colors.color11
	property color backgroundColor: Qt.rgba(contentColor.r, contentColor.g, contentColor.b, 0.3)
	required property int index
	required property var workspaces // array 5 per screen, ej: [1,2,3,4,5] or [6,7,8,9,10]
	required property bool isFocused

	height: 25
	width: 30
	implicitWidth: text.implicitWidth
	implicitHeight: text.implicitHeight
	color: {
		if (mouseArea.containsMouse || isFocused) return backgroundColor
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
		color: isFocused ? Wal.colors.color2 : Wal.colors.color1
		font.family: "Fira Code"
		font.bold: wsButton.isFocused
	}

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true
		onClicked: wsButton.clicked()
	}
}
