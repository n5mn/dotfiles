local bind = hl.bind
local exec = hl.dsp.exec_cmd

local dotfiles = os.getenv("HOME") .. "/dotfiles"

-- Apps
bind("SUPER + SPACE", exec("alacritty"))
bind("SUPER + E", exec("thunar"))
bind("SUPER + F", exec("firefox"))
bind("SUPER + B", exec("brave"))
bind("SUPER + R", exec("rofi -show drun"))
bind("SUPER + C", exec("chatterino"))
bind("SUPER + M", exec("thunderbird"))
bind("SUPER + T", exec("termius"))
bind("SUPER + S", exec("spotify-launcher"))
bind("SUPER + SHIFT + D", exec("vesktop"))
bind("SUPER + A", exec("authy"))
bind("SUPER + SHIFT + A", exec("coppwr"))

-- Screenshots
bind("SUPER + PRINT", exec("hyprshot -m window"))
bind("SUPER + SHIFT + PRINT", exec("hyprshot -m all"))
bind("PRINT", exec("hyprshot -m output"))
bind("SUPER + SHIFT + S", exec("hyprshot -m region"))

-- Audio
bind("XF86AudioMute", exec("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
bind("XF86AudioRaiseVolume", exec("pactl set-sink-volume @DEFAULT_SINK@ +1%"))
bind("XF86AudioLowerVolume", exec("pactl set-sink-volume @DEFAULT_SINK@ -1%"))
bind("XF86AudioPlay", exec("playerctl --player=spotify play-pause"))
bind("XF86AudioNext", exec("playerctl --player=spotify next"))
bind("XF86AudioPrev", exec("playerctl --player=spotify previous"))
bind("XF86AudioStop", exec("playerctl --player=spotify pause"))
bind("SUPER + Z", exec("pactl set-source-mute 0 toggle"))
bind("SUPER + mouse:276", exec("playerctl --player=spotify next"))
bind("SUPER + mouse:275", exec("playerctl --player=spotify previous"))
bind("SUPER + mouse:274", exec("playerctl --player=spotify play-pause"))

bind("SUPER + SHIFT + M", exec("dunstctl set-paused toggle"))

-- Window management
bind("SUPER + P", function()
	hl.dispatch(hl.dsp.window.float({action = "toggle"}))
end)
bind("SUPER + left", hl.dsp.focus({direction = "l"}))
bind("SUPER + right", hl.dsp.focus({direction = "r"}))
bind("SUPER + down", hl.dsp.focus({direction = "d"}))
bind("SUPER + up", hl.dsp.focus({direction = "u"}))
bind("SUPER + mouse:272", hl.dsp.window.drag(), {mouse = true})
bind("SUPER + mouse:273", hl.dsp.window.resize(), {mouse = true})

bind("SUPER + CTRL + right", hl.dsp.window.move({direction = "r"}))
bind("SUPER + CTRL + left", hl.dsp.window.move({direction = "l"}))
bind("SUPER + CTRL + up", hl.dsp.window.move({direction = "u"}))
bind("SUPER + CTRL + down", hl.dsp.window.move({direction = "d"}))

bind("SUPER + SHIFT + right", hl.dsp.window.resize({ x = 100, y = 0, relative = true})) --("resizeactive, 100 0"))
bind("SUPER + SHIFT + left", hl.dsp.window.resize({ x = -100, y = 0, relative = true}))
bind("SUPER + SHIFT + up", hl.dsp.window.resize({ x = 0, y = -100, relative = true})) --("resizeactive, 0 -100"))
bind("SUPER + SHIFT + down", hl.dsp.window.resize({ x = 0, y = 100, relative = true})) --exec("resizeactive, 0 100"))

bind("SUPER + BACKSPACE", hl.dsp.window.close()) -- no args takes the active window
bind("SUPER + ESCAPE", hl.dsp.window.close())
bind("SUPER + RETURN", hl.dsp.window.fullscreen())

-- Binds for running scripts
-- TODO: rewrite all .sh scripts with lua so i just call them like:
-- require(xyz)
bind("SUPER + CTRL + Q", exec("wlogout -b 2"))
bind("SUPER + SHIFT + W", exec(dotfiles .. "/scripts/update_wallpaper.sh"))
bind("SUPER + CTRL + W", exec(dotfiles .. "/scripts/update_wallpaper.sh select"))
bind("SUPER + SHIFT + B", exec(dotfiles .. "/.config/waybar/toggle.sh"))
bind("SUPER + V", exec(dotfiles .. "/scripts/cliphist.sh"))
bind("ALT + SHIFT + SPACE",  exec(dotfiles .. "/scripts/kblayout.sh"))

-- Binds for changing the workspace
bind("SUPER + TAB", hl.dsp.focus({workspace = "e+1"}))
bind("SUPER + SHIFT + TAB", hl.dsp.focus({workspace = "e-1"}))

for i = 1, 5 do
	bind("SUPER + " .. i, exec(dotfiles .. "/scripts/workspace.sh " .. i .. " 5"))
end

for i = 1, 5 do
	bind("SUPER + SHIFT + " .. i, exec(dotfiles .. "/scripts/workspace.sh move " .. i .. " 5"))
end
