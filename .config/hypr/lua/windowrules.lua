hl.window_rule({
	name = "picture-in-picture",
	float = true,
	match = { title = "(Picture in picture)" },
})

hl.window_rule({
	name = "rofi",
	match = { class = "^(Rofi)$" },
	float = true,
})

hl.window_rule({
	name = "reminder",
	match = { title = "(Reminder)" },
	float = true
})

hl.window_rule({
	name = "pavucontrol",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true
})

hl.window_rule({
	name = "xdg-desktop-portal-gtk",
	match = { class = "^(xdg-desktop-portal-gtk)$" },
	float = true
})

hl.window_rule({
	name = "xwaylandvideobridge",
	match = { class = "^(xwaylandvideobridge)$" },
	opacity = "0.0 override",
	max_size = "600, 400",
	no_anim = true,
	no_initial_focus = true,
	no_blur = true
})
