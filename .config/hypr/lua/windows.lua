-- source = ~/.cache/wal/colors-hyprland.conf
local colors = require("lua.colors")

hl.config({
	general = {
		gaps_in = 1,
		gaps_out = 1,
		border_size = 2,
		allow_tearing = true,
		["col.active_border"] = colors.color11,
		["col.inactive_border"] = colors.color14,
		layout = "master",
	},

	decoration = {
		rounding = 0,
		blur = {
			enabled = true,
			size = 2,
			passes = 2,
			new_optimizations = true,
			ignore_opacity = true,
			xray = true,
		},
	},

	-- active_opacity = 1,
	-- inactive_opacity = 1,
	-- fullscreen_opacity = 1,

	shadow = {
		-- enabled = false,
		-- range = 3,
		-- offset = 2, 2,
		-- render_power = 3,
		-- color = 0x66000000,
	},

	misc = {
		enable_swallow = true,
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
	},

	dwindle = {
		preserve_split = true,
		force_split = 2,
	},
	-- 	gestures = {
	-- 		workspace_swipe = false, 
	-- }
})


