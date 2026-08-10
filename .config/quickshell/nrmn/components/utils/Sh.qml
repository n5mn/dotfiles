import QtQuick
import Quickshell.Io

QtObject {
	id: sh
	property string command

	readonly property var process: Process {
		command: ["sh", "-c", sh.command]
	}

	function exec(cmd) {
		if (cmd !== undefined) sh.command = cmd 
		process.startDetached();
	}
}

