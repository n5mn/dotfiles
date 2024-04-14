#!/bin/bash
screenshot="Screenshot_$(date +%Y-%m-%d-%H-%M-%S).png"
grim -g "$(slurp)" "$HOME/Pictures/Screenshots/$screenshot" && wl-copy < "$HOME/Pictures/Screenshots/$screenshot"
