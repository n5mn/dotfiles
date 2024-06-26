#!/bin/sh

# . = source
# avoiding "bashims" now is POSIX-compliant

. ./install/installer.sh

echo "This script creates symlinks between $HOME/dotfiles and $HOME/.config directories."
echo "-> Checking if $HOME/.config exists"

echo "-> Installing general dotfiles"

symlink alacritty.toml $HOME/.cache/wal/alacritty.toml $HOME/.config/alacritty/alacritty.toml
symlink nvim $HOME/dotfiles/nvim/ $HOME/.config/nvim
symlink rofi $HOME/dotfiles/rofi/ $HOME/.config/rofi
symlink dunstrc $HOME/.cache/wal/dunstrc $HOME/.config/dunst/dunstrc
symlink gtk-3.0 $HOME/dotfiles/gtk/gtk-3.0/ $HOME/.config/gtk-3.0
symlink hypr $HOME/dotfiles/hypr/ $HOME/.config/hypr
symlink waybar $HOME/dotfiles/waybar/ $HOME/.config/waybar
symlink wlogout $HOME/dotfiles/wlogout/ $HOME/.config/wlogout
symlink starship $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml
symlink wofi $HOME/dotfiles/wofi/ $HOME/.config/wofi

wal -i $HOME/dotfiles/wallpapers/
echo "Pywal templates initiated!"

symlink .gtkrc-2.0 $HOME/dotfiles/gtk/.gtkrc-2.0 $HOME/.gtkrc-2.0
symlink .Xresources $HOME/dotfiles/gtk/.Xresources $HOME/.Xresources
symlink .icons $HOME/dotfiles/gtk/.icons/ $HOME/.icons
symlink xinitrc $HOME/dotfiles/home/.xinitrc $HOME/.xinitrc
symlink vimrc $HOME/dotfiles/home/.vimrc $HOME/.vimrc
symlink zshrc $HOME/dotfiles/home/zsh/.zshrc $HOME/.zshrc

echo "DONE! Please reboot your system!"
