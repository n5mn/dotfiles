local function bezier(name, x0, y0, x1, y1)
	return hl.curve(name, {
		type = "bezier",
		points = {{x0, y0}, {x1, y1}}
	})
end
return {
	wind = bezier("wind", 0.05, 0.9, 0.1, 1.05),
	winIn = bezier("winIn", 0.1, 1.1, 0.1, 1.1),
	winOut = bezier("winOut", 0.3, -0.3, 0, 1)
}
