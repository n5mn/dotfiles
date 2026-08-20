import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Quickshell.Services.Mpris
import ".."
import "../colors-quickshell.js" as Wal

PopupShell {
	property var spotify: Mpris.players.values.find(
		p => p.identity === "Spotify"
	)
	property string icon: spotify.isPlaying ? "" : ""
	property string info: spotify.trackTitle.length > 20 ? spotify.trackTitle.substring(0, 17) + "..." : spotify.trackTitle

	id: root
	position: "right"
	ColumnLayout {
		anchors.fill: parent
		anchors.margins: 10
		Image {
			id: icon
			source: root.spotify.trackArtUrl
			height: 100
			fillMode: Image.PreserveAspectFit
			Layout.fillWidth: true
			Layout.fillHeight: true
			Layout.alignment: Qt.AlignHCenter
		} 
		Text {
			text: root.info
			font.family: "Fira Code"
			font.pixelSize: 20
			font.bold: true
			color: Wal.colors.color2
			horizontalAlignment: Text.AlignHCenter
			Layout.fillWidth: true
		}
		Text {
			text: root.spotify.trackArtist
			font.family: "Fira Code"
			font.pixelSize: 12
			font.bold: true
			color: Wal.colors.color2
			horizontalAlignment: Text.AlignHCenter
			Layout.fillWidth: true
		}
		Slider {
			id: slider
			Layout.leftMargin: 15
			Layout.rightMargin: 15
			from: 0
			to: root.spotify.length
			value: root.spotify.position
			Layout.fillWidth: true
			
			// background: Rectangle {
			// 	color: Wal.colors.color2
			// }
			background: Rectangle {
				y: slider.availableHeight / 2 - 2
				width: slider.availableWidth
				height: 4
				color: Wal.colors.color1
				Rectangle {
					width: slider.visualPosition * parent.width
					height: parent.height
					color: Wal.colors.color2
				}
			}
		}
		Timer {
			interval: 1000
			running: root.spotify.isPlaying
			repeat: true
			onTriggered: slider.value = root.spotify.position // re-read extrapolated position
		}
		RowLayout {
			width: parent.width
			Layout.fillWidth: true
			Layout.fillHeight: true
			Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

			component MyButton: Button {
				font.family: "Fira Code"
				font.pixelSize: 16
				font.bold: true
				Layout.preferredWidth: 44

				background: Rectangle {
					color: parent.down
					? Wal.colors.color2
					: parent.hovered
					? Wal.colors.color10
					: Wal.colors.background

					border.width: 1
					border.color: Wal.colors.color2

					Behavior on color {
						ColorAnimation { duration: 200 }
					}
				}

				contentItem: Text {
					text: parent.text
					font: parent.font
					color: parent.hovered
					? Wal.colors.color4
					: Wal.colors.color2

					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter

					Behavior on color {
						ColorAnimation { duration: 200 }
					}
				}
			}
			MyButton {
				text: "󰒮"
				onClicked: root.spotify.previous()
			}
			MyButton {
				text: root.icon
				onClicked: root.spotify.togglePlaying()
			}
			MyButton {
				text: "󰒭"
				onClicked: root.spotify.next()
			}
		}
	}
}
