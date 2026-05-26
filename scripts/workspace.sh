#!/bin/bash

# TODO: make it with lua
if [ $1 == "move" ]; then
	workspace=$(( $2 + ( $( hyprctl monitors -j | jq '.[] | select(.focused) | .id' ) * $3 ) ))
	hyprctl dispatch "hl.dsp.window.move({ workspace = \"$workspace\"})"
else
	workspace=$(( $1 + ( $( hyprctl monitors -j | jq '.[] | select(.focused) | .id' ) * $2 ) )) 
	hyprctl dispatch "hl.dsp.focus({ workspace = \"$workspace\"})"
fi
