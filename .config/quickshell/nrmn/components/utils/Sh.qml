import QtQuick
import Quickshell.Io

QtObject {
	required property string command
	id: sh

	property var process: Process {
		command: ["sh", "-c", sh.command]
	}

	function exec() {
		process.startDetached();
	}
}

