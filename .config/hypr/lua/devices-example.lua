local layout = "us"
local mouse = "your_mouse"

hl.config({
	input = {
		kb_layout = layout,
		follow_mouse = 1,
		touchpad = {
			natural_scroll = true
		}
	}
})

hl.device({
	name = mouse,
	sensitivity = -0.6,
})
