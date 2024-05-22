#!/bin/sh 
screenshot="Screenshot_$(date +%Y-%m-%d-%H-%M-%S).png"
screenshot_path="$HOME/Pictures/Screenshots/$screenshot"
grim "$screenshot_path" && wl-copy < "$screenshot_path"
dunstify -i $screenshot_path "Screenshot saved"
