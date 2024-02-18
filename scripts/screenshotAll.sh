#!/bin/bash 

Screenshot="$(date +%Y-%m-%d-%H-%M-%S)FullScreen.png"
grim "$HOME/Pictures/Screenshots/$Screenshot" && wl-copy < "$HOME/Pictures/Screenshots/$Screenshot"
