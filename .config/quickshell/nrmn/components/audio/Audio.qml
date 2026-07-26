import Quickshell
import QtQuick
import Quickshell.Services.Pipewire
import "../colors-quickshell.js" as Wal
import "../utils/"

Rectangle {
	id: audio
	implicitWidth: Math.min(text.implicitWidth, 400)
	// implicitHeight: text.implicitHeight 
	implicitHeight: parent.height
	property PwNode defaultNode: Pipewire.defaultAudioSink
	property PwNode micNode: Pipewire.defaultAudioSource

	// needed to track changes
	PwObjectTracker { objects: [ defaultNode, micNode ]}

	property int volume: defaultNode.audio.volume * 100
	property bool isMicMuted: micNode.audio.muted

	property var sh: Sh { command: "" }

	property string mText: {
		if (isMicMuted) {
			return " "
		} else {
			return " "
		}
	}

	property string vText: {
		var text = volume + "%"
		if (volume === 0) {
			return "" + text
		} else if (volume < 50) {
			return "" + text
		} else {
			return " " + text
		}
	}

	property string displayText: mText + vText
	color: Wal.colors.background

	Text {
		id: text
		anchors.centerIn: parent
		text: "| " + audio.displayText
		font.family: "Fira Code"
		font.bold: true
		font.pixelSize: 16
		color: Wal.colors.color2

	}
	signal clicked()
	MouseArea {
		anchors.fill: parent

		acceptedButtons: Qt.LeftButton | Qt.RightButton
		onClicked: (mouse) => {

			if (mouse.button === Qt.LeftButton) {
				// in the future i can replace this with a custom mixer
				// too much work tbh
				audio.sh.command = "pavucontrol"
				audio.sh.exec()
			} else {
				audio.micNode.audio.muted = !audio.micNode.audio.muted
			}
		}
	}
}
