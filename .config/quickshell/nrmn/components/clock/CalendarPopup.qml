import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."
import "../colors-quickshell.js" as Wal

PopupShell {
	position: "left"
	content: ColumnLayout {
		anchors.fill: parent

		Text {
			text: Qt.formatDateTime(new Date(), "MMMM")
			font.family: "Fira Code"
			font.pixelSize: 16
			font.bold: true
			color: Wal.colors.color1
			horizontalAlignment: Text.AlignHCenter
			Layout.fillWidth: true
			Layout.margins: 5
		}

		Rectangle {
			Layout.fillWidth: true
			Layout.margins: 5
			height: 1
			color: Wal.colors.color11
		}

		DayOfWeekRow {
			locale: grid.locale

			delegate: Text {
				required property var model
				text: model.shortName
				font.family: "Fira Code"
				font.pixelSize: 16
				font.bold: true
				color: Wal.colors.color2

			}
			Layout.margins: 5
			Layout.fillWidth: true
		}

		Rectangle {
			Layout.fillWidth: true
			Layout.margins: 5
			height: 1
			color: Wal.colors.color11
		}

		MonthGrid {
			id: grid
			month: new Date().getMonth()
			year: new Date().getFullYear()
			delegate: Text {
				required property var model
				text: model.day
				font.family: "Fira Code"
				font.pixelSize: 16
				font.bold: true
				color: { if (model.day === new Date().getDate()) { return Wal.colors.color15 } else { return Wal.colors.color2 } }
				opacity: model.month !== new Date().getMonth() ? 0.2 : 1

			}

			Layout.margins: 5
			Layout.fillWidth: true
			Layout.fillHeight: true
		}
	}
}
