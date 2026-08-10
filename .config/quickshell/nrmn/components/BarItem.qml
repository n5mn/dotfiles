import Quickshell
import QtQuick
import "./colors-quickshell.js" as Wal

Rectangle {

	property string displayText
	required property int relativeWidth
	property Component content: null
	readonly property bool isHovered: mouseArea.containsMouse

	id: root 
	implicitWidth: Math.min(text.implicitWidth, relativeWidth)
	implicitHeight: parent.height
	color: Wal.colors.background

	// load content if provided, otherwise show a simple button with text
	Loader {
		sourceComponent: root.content
		anchors.centerIn: parent
	}

	Text {
		id: text
		visible: root.content === null
		anchors.centerIn: parent
		text: root.displayText
		color: {
			if (mouseArea.containsMouse) {
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
