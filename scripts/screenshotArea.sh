#!/bin/bash

grim -g "$(slurp)" "$HOME/Pictures/Screenshots/$(date +%Y-%m-%d-%H-%M-%S).png" #| wl-copy
