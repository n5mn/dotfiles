import Quickshell
import QtQuick
import "components"
import "./colors/colors-quickshell.js" as Wal

Scope {
	id: root
	property string time

	Variants {
		model: Quickshell.screens

		PanelWindow {
			id: panel
			required property var modelData
			property int screenIndex: Quickshell.screens.indexOf(modelData)
			// property int screenIndex: 0
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

				Text {
					padding: 5
					anchors.centerIn: parent
					text: Time.clock
					font.family: "JetBrains Mono"
					color: Wal.colors.color11 
				}

				Row {
					anchors.verticalCenter: parent.verticalCenter
					anchors.left: parent.left
					spacing: 8
					padding: 6

					Repeater {
						id: ws
						model: Workspaces.getWorkspacesForScreen(panel.screenIndex)
						delegate: WorkspaceButton {
							workspaces: ws.model[index]
							isFocused: Workspaces.focusedWorkspace() === ws.model[index]
							onClicked: Workspaces.switchToWorkspace(ws.model[index])
							// onClicked: console.log(ws.model) // Workspaces.switchToWorkspace(ws.model[index])
							// onClicked: console.log()
						}
					}
				}
			}
		}
	}
}
