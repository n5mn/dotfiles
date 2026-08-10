import Quickshell
import QtQuick
import "../colors-quickshell.js" as Wal

Rectangle {
	id: workspacesRow
	height: parent.height
	width: parent.width
	// color: "red"
	color: Wal.colors.background
	// height: ws.implicitHeight
	// width: ws.implicitWidth
	Row {
		spacing: 5
		anchors.centerIn: parent
		Repeater {
			id: ws
			model: Workspaces.getWorkspacesForScreen(panel.screenIndex)

			delegate: WorkspaceButton {
				workspaces: ws.model[index]
				isFocused: Workspaces.focusedWorkspace() === ws.model[index]
				onClicked: Workspaces.switchToWorkspace(ws.model[index])
			}
		}
	}
}
