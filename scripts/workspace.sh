#!/bin/bash
if [ $1 == "move" ]; then
	hyprctl dispatch movetoworkspace $(( $2 + ( $( hyprctl monitors -j | jq '.[] | select(.focused) | .id' ) * $3 ) ))
else
	hyprctl dispatch workspace $(( $1 + ( $( hyprctl monitors -j | jq '.[] | select(.focused) | .id' ) * $2 ) )) 
fi
