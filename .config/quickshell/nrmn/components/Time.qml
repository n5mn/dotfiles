pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root
  readonly property string clock: {
    Qt.formatDateTime(clock.date, "dddd, dd MMMM yyyy - hh:mm'")
  }

  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }
}
