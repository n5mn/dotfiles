#!/bin/bash

cache_file="$HOME/.cache/current_wallpaper"

# Create cache file if not exists
if [ ! -f $cache_file ] ;then
    cp $HOME/dotfiles/wallpaper/1.jpg $cache_file
fi

current_wallpaper=$(cat "$cache_file")

case $1 in

    # Load wallpaper from .cache of last session 
    "init")
        sleep 1
        if [ -f $cache_file ]; then
            python3.11 /usr/bin/wal -q -i $current_wallpaper
        else
            python3.11 /usr/bin/wal -q -i $HOME/dotfiles/wallpapers/
        fi
    ;;

    # Select wallpaper with rofi
    "select")
        sleep 0.2
        selected=$( find "$HOME/dotfiles/wallpapers" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \) -exec basename {} \; | sort -g | while read rfile
        do
            echo -en "$rfile\x00icon\x1f$HOME/dotfiles/wallpapers/${rfile}\n"
        done | rofi -dmenu -i -replace -config $HOME/dotfiles/rofi/config-wallpaper.rasi)
        if [ ! "$selected" ]; then
            echo "No wallpaper selected"
            exit
        fi
        python3.11 /usr/bin/wal -q -i $HOME/dotfiles/wallpapers/$selected
    ;;

    # Randomly select wallpaper 
    *)
        python3.11 /usr/bin/wal -q -i $HOME/dotfiles/wallpapers/
    ;;

esac

# Load current pywal color scheme
source "$HOME/.cache/wal/colors.sh"

cp $wallpaper $cache_file

# get wallpaper image name
newwall=$(echo $wallpaper | sed "s|$HOME/dotfiles/wallpapers/||g")

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

random=$(($RANDOM % ${#transitions[@]}))

# Set the new wallpaper
swww img $wallpaper \
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type="${transitions[$random]}" \
    --transition-duration=0.5 \
    --transition-pos "$(hyprctl cursorpos)"

$HOME/dotfiles/waybar/launch.sh


# Send notification
if [ "$1" == "init" ] ;then
    echo ":: Init"
else
    sleep 0.5
    killall dunst
    sleep 1
    notify-send Wallpaper Updated!
fi

echo "DONE!"
