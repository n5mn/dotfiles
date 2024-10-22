#!/bin/sh

cache_file="$HOME/.cache/current_wallpaper"

# Create cache file if not exists
if [ ! -f $cache_file ]; then
	cp $HOME/dotfiles/wallpaper/1.jpg $cache_file
fi

case $1 in

	# Load wallpaper from .cache of last session 
	"init")
		sleep 1
		if [ -f $cache_file ]; then
			wal -q -i $cache_file
		else
			wal -q -i $HOME/dotfiles/wallpapers/
		fi
		;;

	# Select wallpaper with rofi
	"select")
		selected=$( find "$HOME/dotfiles/wallpapers" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort -g | while read rfile; do
		echo -en "$rfile\x00icon\x1f$HOME/dotfiles/wallpapers/${rfile}\n"
			done | rofi -dmenu -i -replace -config $HOME/dotfiles/.config/rofi/config-wallpaper.rasi)

		if [ ! "$selected" ]; then
			exit
		fi

		wal -q -i $HOME/dotfiles/wallpapers/$selected
		;;

	# Randomly select wallpaper 
	*)
		wal -q -i $HOME/dotfiles/wallpapers/
		;;

esac

# Load current pywal color scheme
source "$HOME/.cache/wal/colors.sh"

cp $wallpaper $cache_file

transitions=(
	"simple"
	"left"
	"top"
	"grow"
	"center"
	"any"
	"wipe"
	"outer"
)

random=$((RANDOM % ${#transitions[@]}))

# Set the new wallpaper
swww img $wallpaper \
	--transition-bezier .43,1.19,1,.4 \
	--transition-fps=60 \
	--transition-type="${transitions[$random]}" \
	--transition-duration=0.8 \
	--transition-pos "$(hyprctl cursorpos)"

if [ ! "$1" == "init" ] ;then
	killall dunst
	sleep 0.8
fi

sleep 0.2
notify-send -i $cache_file "Wallpaper Updated!"
clear
echo "DONE!"
$HOME/dotfiles/.config/waybar/launch.sh
#ags -q
#ags
