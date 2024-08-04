#!/bin/sh

if [ -f ~/.cache/waybar_disabled ]; then
    rm ~/.cache/waybar_disabled
    ~/dotfiles/.config/waybar/launch.sh &

else
    touch ~/.cache/waybar_disabled
    killall waybar
fi
