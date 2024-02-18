#!/bin/bash 
Screenshot="Screenshot_$(date +%Y-%m-%d-%H-%M-%S).png"
grim "$HOME/Pictures/Screenshots/$Screenshot" && wl-copy < "$HOME/Pictures/Screenshots/$Screenshot"