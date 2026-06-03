require("lua.beziers")

-- animations
local function animation(leaf, speed, curve, style)
	return hl.animation({
		leaf = leaf,
		enabled = true,
		speed = speed,
		bezier = curve,
		style = style
	})
end

animation("windows", 6, "wind", "slide")
animation("windowsIn", 6, "winIn", "slide")
animation("windowsOut", 6, "winOut", "slide")
animation("windowsMove", 5, "wind", "slide")
animation("workspaces", 4, "wind", "slidefade 20%")
