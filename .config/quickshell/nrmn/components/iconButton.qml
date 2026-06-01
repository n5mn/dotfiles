import QtQuick

Rectangle {
	id: root
	property alias label: textItem.text
	signal clicked

	width: 26
	height: 26
	radius: 6
	color: mouse.containsMouse ? "#333" : "transparent"

	Behavior on color {
		ColorAnimation { duration: 100 }
	}

	Text {
		id: textItem
		anchors.centerIn: parent
		color: "white"
	}

	MouseArea {
		id: mouse
		anchors.fill: parent
		hoverEnabled: true
		onClicked: root.clicked()
	}
}

