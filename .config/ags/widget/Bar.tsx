import { App, Astal, Gtk, Gdk } from "astal/gtk3"
import { Variable } from "astal"

const time = Variable("").poll(1000, "date +'%A, %d %B %Y - %R'")

export default function Bar(gdkmonitor: Gdk.Monitor) {
	return <window
		className="Bar"
		gdkmonitor={gdkmonitor}
		exclusivity={Astal.Exclusivity.EXCLUSIVE}
		anchor={Astal.WindowAnchor.TOP
			| Astal.WindowAnchor.LEFT 
			| Astal.WindowAnchor.RIGHT 
		}
		application={App}>
		<centerbox>
			<button
				onClicked="echo hello"
				halign={Gtk.Align.START} >
				Hello!
			</button>
			<box />
			<button
				onClick={() => print("hello")}
				halign={Gtk.Align.CENTER} >
				<label label={time()} />
			</button>
		</centerbox>
	</window>
}
