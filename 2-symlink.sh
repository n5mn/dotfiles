#!/bin/bash

ConfigDirectory=(
    "alacritty"
    "rofi"
    "dunst"
    "hypr"
    "waybar"
    "wlogout"
    "gtk-3.0"
)
HomeDirectory=(
    ".bashrc"
    ".vimrc"
    ".vim"
    ".zshrc"
    ".p10k.zsh"
    ".gtkrc-2.0"
    ".Xresources"
    ".icons"
)

Backup() {
    mkdir -p "$HOME/.old/"
    for folder in "${ConfigDirectory[@]}"; do
        cp -r "$HOME/.config/$folder" "$HOME/.old/$folder"
    done
    for file in "${HomeDirectory[@]}"; do
        cp -r "$HOME/$file" "$HOME/.old/"
    done
}

source $(dirname "$0")/scripts/installer.sh
echo "This script creates symlinks between ~/dotfiles and ~/.config directories."
echo "-> Checking if ~/.config exists"
# ----------------------------------------------------------------------------------------- #

if [ -d ~/.config ]; then
    echo ".config folder already exists."
    echo "Backing up configuration files..."
    Backup
    echo "Backup completed!"

else
    mkdir ~/.config
    echo ".config folder created."
fi

echo "-> Installing general dotfiles"
# ----------------------------------------------------------------------------------------- #

Symlink alacritty ~/dotfiles/alacritty/ ~/.config/alacritty
Symlink nvim ~/dotfiles/nvim/ ~/.config/nvim
Symlink rofi ~/dotfiles/rofi/ ~/.config/rofi
Symlink dunst ~/dotfiles/dunst/ ~/.config/dunst
Symlink gtk-3.0 ~/dotfiles/gtk/gtk-3.0/ ~/.config/gtk-3.0
Symlink hypr ~/dotfiles/hypr/ ~/.config/hypr
Symlink waybar ~/dotfiles/waybar/ ~/.config/waybar
Symlink wlogout ~/dotfiles/wlogout/ ~/.config/wlogout

wal -i screenshots/
echo "Pywal templates initiated!"

Symlink .gtkrc-2.0 ~/dotfiles/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
Symlink .Xresources ~/dotfiles/gtk/.Xresources ~/.Xresources
Symlink .icons ~/dotfiles/gtk/.icons/ ~/.icons
Symlink xinitrc ~/dotfiles/home/.xinitrc ~/.xinitrc
Symlink vim ~/dotfiles/home/.vim/ ~/.vim 
Symlink vimrc ~/dotfiles/home/.vimrc ~/.vimrc
Symlink zshrc ~/dotfiles/home/.zshrc ~/.zshrc # move this to the .config directory
Symlink p10k ~/dotfiles/home/.p10k.zsh ~/.p10k.zsh # move this to the .config directory

# ----------------------------------------------------------------------------------------- #

echo "DONE! Please reboot your system!"
