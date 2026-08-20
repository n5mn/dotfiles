import Quickshell
import QtQuick
import "../colors-quickshell.js" as Wal

Rectangle {
	id: workspacesRow
	property int focused: Workspaces.focused
	height: parent.height
	width: parent.width
	color: Wal.colors.background
	Row {
		spacing: 5
		anchors.centerIn: parent
		Repeater {
			id: ws
			model: Workspaces.getWorkspacesForScreen(panel.screenIndex)

			delegate: WorkspaceButton {
				workspaces: ws.model[index]
				isFocused: workspacesRow.focused === ws.model[index]
				onClicked: Workspaces.switchToWorkspace(ws.model[index])
			}
		}
	}
}
