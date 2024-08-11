const hyprland = await Service.import("hyprland")
const notifications = await Service.import("notifications")
const mpris = await Service.import("mpris")
const audio = await Service.import("audio")
//const battery = await Service.import("battery")

const date = Variable("", {
	poll: [1000, 'date "+%A, %d %B %Y - %R"'],
})

// widgets can be only assigned as a child in one container
// so to make a reuseable widget, make it a function
// then you can simply instantiate one by calling it

function Workspaces(monitor) {
	const activeId = hyprland.active.workspace.bind("id")
	const workspacesPerMonitor = {
		0: [1, 2, 3, 4, 5],
		1: [6, 7, 8, 9, 10],
	}

	const workspaces = workspacesPerMonitor[monitor].map(id => Widget.Button({
		on_clicked: () => hyprland.messageAsync(`dispatch workspace ${id}`),
		child: Widget.Label(`${id}`),
		class_name: activeId.as(i => `${i === id ? "focused" : ""}`),
	}))

	return Widget.Box({
		class_name: "workspaces",
		children: workspaces,
	})
}

function Clock() {
	return Widget.Label({
		class_name: "clock",
		label: date.bind(),
	})
}
// we don't need dunst or any other notification daemon
// because the Notifications module is a notification daemon itself
function Notification() {
	const popups = notifications.bind("popups")

	return Widget.Box({
		class_name: "notification",
		visible: popups.as(p => p.length > 0),
		children: [
			Widget.Icon({
				icon: "preferences-system-notifications-symbolic",
			}),
			Widget.Label({
				label: popups.as(p => p[0]?.summary || ""),
			}),
		],
	})
}

function Media() {
	const max_length = 60

	const label = Utils.watch("", mpris, "player-changed", () => {
		const spotify = mpris.players.find(p => p.name === 'spotify')
		if (spotify) {
			const { play_back_status, track_artists, track_title } = spotify
			const icon = play_back_status === "Playing" ? " " : " "
			const bar_info = `${icon}  ${track_artists.join(", ")} - ${track_title}`

			const display_info = bar_info.length > max_length 
			? bar_info.slice(0, max_length) + "..."
			: bar_info

			return display_info
		} else {
			return "Nothing is playing"
		}
	})
	return Widget.Button({
		class_name: "media",
		on_primary_click: () => mpris.getPlayer("spotify")?.playPause(),
		on_secondary_click: () => mpris.getPlayer("spotify")?.next(),
		on_middle_click: () => mpris.getPlayer("spotify")?.previous(),
		child: Widget.Label({ label }),
	})
}



function Volume() {
	const icons = {
		101: "overamplified",
		67: "high",
		34: "medium",
		1: "low",
		0: "muted",
	}

	function getIcon() {
		const icon = audio.speaker.is_muted ? 0 : [101, 67, 34, 1, 0].find(
			threshold => threshold <= audio.speaker.volume * 100)

		return `audio-volume-${icons[icon]}-symbolic`
	}

	const icon = Widget.Icon({
		icon: Utils.watch(getIcon(), audio.speaker, getIcon),
	})

	const slider = Widget.Slider({
		hexpand: true,
		draw_value: false,
		on_change: ({ value }) => audio.speaker.volume = value,
		setup: self => self.hook(audio.speaker, () => {
			self.value = audio.speaker.volume || 0
		}),
	})

	return Widget.Box({
		class_name: "volume",
		css: "min-width: 150px",
		children: [icon, slider],
	})
}

// layout of the bar
function Left(monitor) {
	return Widget.Box({
		spacing: 8,
		children: [
			Workspaces(monitor),
		],
	})
}

function Center() {
	return Widget.Box({
		spacing: 8,
		children: [
			Clock(),
			Notification(),
		],
	})
}

function Right() {
	return Widget.Box({
		hpack: "end",
		spacing: 8,
		children: [
			Media(),
			Volume(),
		],
	})
}

function Bar(monitor = 0) {
	return Widget.Window({
		name: `bar-${monitor}`, // name has to be unique
		class_name: "bar",
		monitor,
		anchor: ["top", "left", "right"],
		exclusivity: "exclusive",
		child: Widget.CenterBox({
			start_widget: Left(monitor),
			center_widget: Center(),
			end_widget: Right(),
		}),
	})
}

App.config({
	style: "./style.css",
	windows: [
		Bar(0),
		Bar(1)
		// you can call it, for each monitor
		//Bar(0),
		//Bar(1)
	],
})

export { }
