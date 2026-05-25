-- autostart
hl.on("hyprland.start", function()
	hl.exec_cmd("awww-daemon")
	hl.exec_cmd("dunst")
	hl.exec_cmd("~/dotfiles/scripts/update_wallpaper.sh init")
	hl.exec_cmd("~/dotfiles/scripts/gtk.sh")
	hl.exec_cmd("hyprctl setcursor Bibata-Original-Classic 24")
	hl.exec_cmd("~/dotfiles/.config/waybar/launch.sh")
	hl.exec_cmd("wl-paste --watch cliphist store")

	hl.exec_cmd("alacritty", {workspace = "1 silent"})
end
)
