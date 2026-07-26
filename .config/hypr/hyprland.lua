-- For all categories, see https://wiki.hyprland.org/version-selector/

require("lua.init")
require("lua.animations")
if File_exists(HOME .. "/.config/hypr/lua/autostart.lua") then
	require("lua.autostart")
end
if File_exists(HOME .. "/.config/hypr/lua/devices.lua") then
	require("lua.devices")
end
require("lua.enviroment")
if File_exists(HOME .. "/.config/hypr/lua/custom-env.lua") then
	require("lua.custom-env")
end
require("lua.keybindings")
require("lua.monitors")
require("lua.windows")
require("lua.windowrules")
require("lua.workspacerules")

-- require("~/.cache/wal/colors-hyprland")

