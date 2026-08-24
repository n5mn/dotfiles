import Quickshell
import QtQuick
import QtQuick.Layouts
import "components/workspaces"
import "components/weather"
import "components/mediaplayer"
import "components/clock"
import "components/audio"
import "components/notifications"
import "components/wlogout"
import "./components/colors-quickshell.js" as Wal

Scope {
	id: root
	property string time

	Variants {
		model: Quickshell.screens

		PanelWindow {
			id: panel
			required property var modelData
			property int screenIndex: Quickshell.screens.indexOf(modelData)
			screen: modelData

			anchors {
				top: true
				left: true
				right: true
			}
			implicitHeight: 35

			Rectangle {
				id: bar
				anchors.fill: parent
				color: Wal.colors.background
				border.color: Wal.colors.color11
				border.width: 2

				RowLayout {
					anchors.fill: parent
					anchors.margins: 5
					spacing: 5

					Row {
						Layout.preferredWidth: parent.width * 0.4
						Layout.fillHeight: true
						Layout.alignment: Qt.AlignLeft
						spacing: 10
						ClockButton { onRightClicked: calendarPopup.visible = !calendarPopup.visible }
						WeatherButton { onRightClicked: weatherPopup.visible = !weatherPopup.visible }
					}
					Row {
						Layout.alignment: Qt.AlignVCenter
						Layout.fillHeight: true
						Layout.fillWidth: true
						spacing: 10
						WorkspacesRow {}
					}
					Row {
						Layout.fillHeight: true
						Layout.preferredWidth: parent.width * 0.4
						Layout.alignment: Qt.AlignRight
						layoutDirection: Qt.RightToLeft
						spacing: 10
						Wlogout {}
						Notifications {}
						Audio {}
						Mediaplayer { onRightClicked: mediaplayerPopup.visible = !mediaplayerPopup.visible }
					}
				}	
			}
			CalendarPopup { 
				id: calendarPopup 
				panelWindow: panel
			}
			WeatherPopup {
				id: weatherPopup
				panelWindow: panel
			}
			MediaplayerPopup {
				id: mediaplayerPopup
				panelWindow: panel
			}
		}
	}
}
