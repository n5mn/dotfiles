#!/bin/bash

# Select random wallpaper and create color scheme
wal -q -i ~/dotfiles/wallpapers/

# Load current pywal color scheme
source "$HOME/.cache/wal/colors.sh"

# Copy selected wallpaper into .cache folder
cp $wallpaper ~/.cache/current_wallpaper.jpg

# get wallpaper iamge name
newwall=$(echo $wallpaper | sed "s|$HOME/dotfiles/wallpapers/||g")

transitions=(
    "simple"
    "left"
    "top"
    "grow"
    "center"
    "any"
    "outer"
)

random=$(($RANDOM % ${#transitions[@]}))

# Set the new wallpaper
swww img $wallpaper \
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type="${transitions[$random]}" \
    --transition-duration=1.0 \
    --transition-pos "$(hyprctl cursorpos)"

~/dotfiles/waybar/launch.sh

# Load pywal color scheme for notifications and restart it
if [ ! -f ~/dotfiles/dunst/dunstrc ]; then
    ln -sf ~/.cache/wal/dunstrc ~/dotfiles/dunst/dunstrc
fi

if [ ! -f ~/.config/cava/config ]; then
    ln -sf ~/.cache/wal/cava.conf ~/.config/cava/config
fi

if [ ! -f ~/.config/vesktop/themes/discord-wal.css ]; then
    ln -sf ~/.cache/wal/discord-wal.css ~/.config/vesktop/themes/discord-wal.css
fi

killall dunst
notify-send Wallpaper Updated!
echo "DONE!"