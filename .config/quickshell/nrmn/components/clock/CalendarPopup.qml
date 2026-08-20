import Quickshell
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import ".."
import "../colors-quickshell.js" as Wal

PopupShell {
	property int currentMonth: new Date().getMonth()
	property int currentYear: new Date().getFullYear()

	property string monthName: Qt.formatDateTime(new Date(currentYear, currentMonth, 1),"MMMM")

	id: root
	position: "left"
	onVisibleChanged: {
		if (!root.visible) {
			root.currentMonth = new Date().getMonth()
			root.currentYear = new Date().getFullYear()

		}
	}
	ColumnLayout {
		id: content
		anchors.fill: parent

		Text {
			text: root.monthName + " - " + root.currentYear
			font.family: "Fira Code"
			font.pixelSize: 16
			font.bold: true
			color: Wal.colors.color14
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
			month: root.currentMonth
			year: root.currentYear
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
	MouseArea {
		id: mouseArea
		acceptedButtons: Qt.LeftButton | Qt.RightButton
		anchors.fill: parent
		hoverEnabled: true
		onClicked: (mouse) => {
			const offset = mouse.button === Qt.LeftButton ? 1 : -1
			const date = new Date(root.currentYear, root.currentMonth + offset, 1)
			root.currentMonth = date.getMonth()
			root.currentYear = date.getFullYear()
		}
	}
}
