import Quickshell
import QtQuick
import Quickshell.Services.Mpris
import "../../colors/colors-quickshell.js" as Wal

Rectangle {
	id: mediaplayer

	implicitWidth: Math.min(text.implicitWidth, 500)
	implicitHeight: parent.height
	color: Wal.colors.background
	// color: "red"
	property var spotify: Mpris.players.values.find(
		p => p.identity === "Spotify"
	)

	property string trackInfo: {
		if (spotify) {
			return spotify.trackArtist + " - " + spotify.trackTitle 
		} else {
			return "No track playing"
		}
	}
	property string icon: {
		if (spotify) {
			if (spotify.isPlaying) { return " " } else { return " "}
		} 
		else { return "" }
	}
	Text {
		id: text
		elide: Text.ElideRight
		width: parent.width
		anchors.centerIn: parent
		text: mediaplayer.icon + mediaplayer.trackInfo
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
	signal clicked()
	signal wheel()

	MouseArea {
		id: mouseArea

		anchors.fill: parent
		hoverEnabled: true
		// onClicked: mediaplayer.spotify.togglePlaying()
		acceptedButtons: Qt.LeftButton | Qt.RightButton
		onClicked: (mouse) => {
			if (mouse.button === Qt.LeftButton) {
				// console.log(mediaplayer.implicitWidth)
				mediaplayer.spotify.togglePlaying()
			} else {
				console.log("right button shoudl be a popup")
			}

		}
		onWheel: (event) => {
			if (event.angleDelta.y > 0) {
				mediaplayer.spotify.next()
			} else {
				mediaplayer.spotify.previous()
			}
		}
	}
}
