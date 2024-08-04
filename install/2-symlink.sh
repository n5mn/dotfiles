#!/bin/sh

# . = source
# avoiding "bashims" now is POSIX-compliant

. ./installer.sh

wal -q -i $HOME/dotfiles/wallpapers/
echo "Pywal templates initiated!"

echo "-> Installing general dotfiles"
echo ""
echo "This script creates symlinks between $HOME/dotfiles and $HOME/.config directories."
echo "-> Checking if $HOME/.config exists"

if [ ! -d $HOME/.config/ ]; then
	mkdir -p $HOME/.config
fi

symlink alacritty.toml $HOME/.cache/wal/alacritty.toml $HOME/.config/alacritty/alacritty.toml
symlink dunstrc $HOME/.cache/wal/dunstrc $HOME/.config/dunst/dunstrc
symlink nvim $HOME/dotfiles/.config/nvim/ $HOME/.config/nvim
symlink rofi $HOME/dotfiles/.config/rofi/ $HOME/.config/rofi
symlink gtk-3.0 $HOME/dotfiles/.config/gtk-3.0/ $HOME/.config/gtk-3.0
symlink hypr $HOME/dotfiles/.config/hypr/ $HOME/.config/hypr
symlink waybar $HOME/dotfiles/.config/waybar/ $HOME/.config/waybar
symlink wlogout $HOME/dotfiles/wlogout/ $HOME/.config/wlogout
symlink starship $HOME/dotfiles/.config/starship.toml $HOME/.config/starship.toml
symlink wofi $HOME/dotfiles/.config/wofi/ $HOME/.config/wofi

symlink .gtkrc-2.0 $HOME/dotfiles/.gtkrc-2.0 $HOME/.gtkrc-2.0
symlink .Xresources $HOME/dotfiles/.Xresources $HOME/.Xresources
symlink .icons $HOME/dotfiles/.icons/ $HOME/.icons
symlink vimrc $HOME/dotfiles/.vimrc $HOME/.vimrc
symlink zshrc $HOME/dotfiles/.zshrc $HOME/.zshrc

echo "DONE! Please reboot your system!"
