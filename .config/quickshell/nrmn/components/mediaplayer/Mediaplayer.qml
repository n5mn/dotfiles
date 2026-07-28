import Quickshell
import QtQuick
import Quickshell.Services.Mpris
import ".."

BarItem {
	property var spotify: Mpris.players.values.find(
		p => p.identity === "Spotify"
	)
	property string trackInfo: spotify.trackArtist + " - " + spotify.trackTitle
	property string icon: spotify.isPlaying ? " " : " "
	property int maxSize: 60

	property string info: icon + trackInfo
	property string text: info.length > maxSize ? info.substring(0, maxSize) + "..." : info
	id: mediaplayer

	relativeWidth: 600

	displayText: mediaplayer.text

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
