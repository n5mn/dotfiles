#!/bin/bash
source ./install/installer.sh
source ./install/yay.sh
source ./install/pacman.sh

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
    for i in "${ConfigDirectory[@]}"; do
        cp -r "$HOME/.config/$i" "$HOME/.old/$i"
    done
    for i in "${HomeDirectory[@]}"; do
        cp -r "$HOME/$i" "$HOME/.old/$i"
    done
}

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
Symlink alacritty.toml ~/.cache/wal/alacritty.toml ~/.config/alacritty/alacritty.toml
Symlink nvim ~/dotfiles/nvim/ ~/.config/nvim
Symlink rofi ~/dotfiles/rofi/ ~/.config/rofi
Symlink dunst ~/dotfiles/dunst/ ~/.config/dunst
Symlink dunstrc ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
Symlink gtk-3.0 ~/dotfiles/gtk/gtk-3.0/ ~/.config/gtk-3.0
Symlink hypr ~/dotfiles/hypr/ ~/.config/hypr
Symlink waybar ~/dotfiles/waybar/ ~/.config/waybar
Symlink wlogout ~/dotfiles/wlogout/ ~/.config/wlogout
Symlink starship ~/dotfiles/starship/starship.toml ~/.config/starship.toml

wal -i wallpapers/
echo "Pywal templates initiated!"

Symlink .gtkrc-2.0 ~/dotfiles/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
Symlink .Xresources ~/dotfiles/gtk/.Xresources ~/.Xresources
Symlink .icons ~/dotfiles/gtk/.icons/ ~/.icons
Symlink xinitrc ~/dotfiles/home/.xinitrc ~/.xinitrc
Symlink vimrc ~/dotfiles/home/.vimrc ~/.vimrc
Symlink zshrc ~/dotfiles/home/zsh/.zshrc ~/.zshrc
# ----------------------------------------------------------------------------------------- #

echo "DONE! Please reboot your system!"
