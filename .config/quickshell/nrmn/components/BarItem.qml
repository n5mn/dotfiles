import Quickshell
import QtQuick
import "./colors-quickshell.js" as Wal

Rectangle {

	property string displayText: ""
	required property int relativeWidth
	readonly property bool isHovered: mouseArea.containsMouse

	id: root 
	implicitWidth: root.displayText !== "" ? Math.min(text.implicitWidth, relativeWidth) : relativeWidth
	implicitHeight: parent.height
	color: Wal.colors.background

	Text {
		id: text
		visible: root.displayText !== ""
		anchors.centerIn: parent
		text: root.displayText
		color: {
			if (root.isHovered) {
				return Wal.colors.color4
			}
			return Wal.colors.color2
		}

		font.family: "Fira Code"
		font.pixelSize: 16
		font.bold: true

		Behavior on color {
			ColorAnimation { duration: 200 }
		}
	}

	signal leftClicked()
	signal rightClicked()
	MouseArea {
		id: mouseArea
		acceptedButtons: Qt.LeftButton | Qt.RightButton
		anchors.fill: parent
		hoverEnabled: true
		onClicked: (mouse) => {
			if (mouse.button === Qt.LeftButton) {
				root.leftClicked()
			} else {
				root.rightClicked()
			}
		}
	}
}
