-- # use `hyprctl monitors` to see description params
-- # monitor=name,resolution,position,scale
require("lua.variables")

hl.monitor({
	output = Variables.monitors.primary,
	mode = "2560x1440@144",
	-- mode = "1920x1080@200",
	position = "0x0",
	scale = 1
})

hl.monitor({
	output = Variables.monitors.secondary,
	mode = "1920x1080",
	position = "2560x180",
	-- position = "1920x0",
	scale = 1
})
