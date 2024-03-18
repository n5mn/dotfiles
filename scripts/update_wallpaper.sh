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

random=$[$RANDOM % ${#transitions[@]}]

# Set the new wallpaper
swww img $wallpaper \
    --transition-bezier .43,1.19,1,.4 \
    --transition-fps=60 \
    --transition-type="${transitions[$random]}" \
    --transition-duration=1.0 \
    --transition-pos "$( hyprctl cursorpos )"

~/dotfiles/waybar/launch.sh

# Load pywal color scheme for notifications and restart it 
ln -sf ~/.cache/wal/dunstrc ~/dotfiles/dunst/dunstrc

ln -sf ~/.cache/wal/cava.conf ~/.config/cava/config

killall dunst;notify-send Wallpaper Updated!
echo "DONE!"