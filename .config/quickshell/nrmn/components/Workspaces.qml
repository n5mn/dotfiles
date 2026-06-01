import QtQuick
import Quickshell.Hyprland

pragma Singleton
Item {
	id: hyprlandWorkspaces
	property int focusedWs: Hyprland.focusedWorkspace
		? Hyprland.focusedWorkspace.id 
		: -1
	property int wsCount
	property var ws: Hyprland.workspaces
	// property var monitors: Hyprland.monitors

	function getWorkspacesForScreen(screenIndex) {
		const ids = [1,2,3,4,5,6,7,8,9,10];

		if (screenIndex === 0) return ids.slice(0, 5);
		return ids.slice(5, 10);
	}	

	function getWorkspaceNames(workspaceId) {
		const roman = ["I","II","III","IV","V","VI","VII","VIII","IX","X"];
		return roman[workspaceId - 1]
	}

	function focusedWorkspace() {
		return Hyprland.focusedWorkspace.id 
			? Hyprland.focusedWorkspace.id
			: -1
	}

	function switchToWorkspace(workspaceId) {
		Hyprland.dispatch(`hl.dsp.focus({ workspace = ${workspaceId} })`)
	}
}

