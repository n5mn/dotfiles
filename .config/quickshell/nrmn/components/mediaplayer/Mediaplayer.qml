import Quickshell
import QtQuick
import Quickshell.Services.Mpris
import ".."

BarItem {
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
	id: mediaplayer

	relativeWidth: 500

	displayText: mediaplayer.icon + mediaplayer.trackInfo

	onLeftClicked: mediaplayer.spotify.togglePlaying()
	onRightClicked: console.log("right click maybe a popup someday")

	// custom shit
	signal wheel()
	MouseArea {
		anchors.fill: parent
		acceptedButtons: Qt.NoButton
		onWheel: (event) => {
			if (event.angleDelta.y > 0) {
				mediaplayer.spotify.next()
			} else {
				mediaplayer.spotify.previous()
			}
		}
	}
}
