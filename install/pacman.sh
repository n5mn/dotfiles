#!/bin/bash

packagesPacman=(
    "pacman-contrib" 
    "alacritty" 
    "starship" 
    "neovim" 
    "vim"
    "rofi" 
    "dunst" 
    "nitrogen" 
    "lxappearance" 
    "breeze" 
    "breeze-gtk" 
    "dolphin" # i use thunar should i remove it?
    "exa"
    "tumbler" 
    "cliphist"
    "ttf-font-awesome"
    "ttf-fira-sans"
    "ttf-fira-code"
    "ttf-firacode-nerd"
    "python-pip" 
    "pavucontrol" 
    "xdg-desktop-portal-gtk"
    "xdg-desktop-portal-wlr" 
    "networkmanager" 
    "network-manager-applet" # the GUI network manager
    "networkmanager-openvpn" 
    "ufw" # firewall
    "blueman"
    "bluez"
    "bluez-utils"
    "hyprland" # window manager
    "waybar" # for status bar 
    "jq" # needed for hyprload
    "polkit" # needed for hyprload
    "cpio" # needed for hyprload
)

optionalPackagesPacman=(
    "firefox"
    "obs-studio"
    "discord"
    "spotify-launcher"
    "neofetch"
    "gimp"
    "htop"
    "steam"
)

nvidiaDrivers() {
    echo "Install nvidia drivers? [y/N] "
    read -r yn
    if [[ $yn =~ ^[yY]$ ]]; then
        sudo pacman -S --needed --noconfirm nvidia nvidia-utils
    else 
        echo "Skipping..."
    fi
}
