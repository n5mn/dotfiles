#!/bin/sh

check_file="/tmp/kblayout"

if ! [ -f "$check_file" ]; then
	echo "us" > "$check_file"
fi

kblayout=$(cat "$check_file")

# Toggle layout
if [ "$kblayout" = "us" ]; then
	new_layout="latam"
else
	new_layout="us"
fi

echo "$new_layout" > "$check_file"
hyprctl keyword input:kb_layout "$new_layout"

notify-send "Keyboard Layout" "$new_layout"
