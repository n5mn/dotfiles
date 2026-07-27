pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property string date: {
    Qt.formatDateTime(clock.date, "hh:mm |")
  }
	readonly property string fullDate: {
    Qt.formatDateTime(clock.date, "dddd, dd/MM hh:mm |")
	}
  SystemClock {
    id: clock 
    precision: SystemClock.Seconds
  }
}
