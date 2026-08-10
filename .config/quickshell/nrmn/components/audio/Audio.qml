import Quickshell
import QtQuick
import Quickshell.Services.Pipewire
import "../utils/"
import ".." // import BarItem

BarItem {
	property PwNode defaultNode: Pipewire.defaultAudioSink
	property PwNode micNode: Pipewire.defaultAudioSource

	property int volume: defaultNode.audio.volume * 100
	property bool isMicMuted: micNode.audio.muted

	property var sh: Sh { command: "" }

	// needed to track changes
	PwObjectTracker { objects: [ audio.defaultNode, audio.micNode ]}

	property string mText: isMicMuted ? "  " : " "
	property string vText: {
		var text = volume + "%"
		if (volume === 0) {
			return "" + text
		} else if (volume < 30) {
			return " " + text
		} else {
			return " " + text
		}
	}

	id: audio
	relativeWidth: 400

	displayText: "| " + mText + vText  
	onLeftClicked: {
		audio.sh.exec("pavucontrol")
	}
	onRightClicked: {
		audio.micNode.audio.muted = !audio.micNode.audio.muted
	}

	signal wheel()
	MouseArea {
		anchors.fill: parent
		acceptedButtons: Qt.NoButton
		onWheel: (event) => {
			if (event.angleDelta.y > 0) {
				audio.defaultNode.audio.volume += 0.01 
			} else {
				audio.defaultNode.audio.volume -= 0.01
			}
		}
	}
}

