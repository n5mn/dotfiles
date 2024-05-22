#!/bin/sh

# . = source
# avoiding "bashims" 
# so now is POSIX-compliant

# ----------------------------------------------------------------------------------------- #
. ./install/installer.sh
. ./install/yay.sh
. ./install/pacman.sh

# Check if yay is installed
# ----------------------------------------------------------------------------------------- #

if [ -x "`command -v yay`" ]; then
    echo "yay is installed. You can proceed with the installation"
else
    echo "yay is not installed. Will be installed now!"
    git clone https://aur.archlinux.org/yay-git.git $HOME/yay-git
    cd $HOME/yay-git && makepkg -si
    cd $HOME/dotfiles/
    clear
    echo "yay has been installed successfully."
    echo ""
fi

echo "-> Installing main packages"

# ----------------------------------------------------------------------------------------- #
# Install packages from official repositories and AUR
install_packages_pacman $packages_pacman;
install_packages_yay $packages_yay;

nvidia_drivers

echo "Install optional packages? [y/N]"
read yn
case $yn in
    [yY])
        install_packages_pacman $optional_packages_pacman
        install_packages_yay $optional_packages_yay
        ;;
    *)
        echo "Skipping..."
        ;;
esac

# Install pywal
if [ -f /usr/bin/wal ]; then
    echo "pywal already installed."
else
    yay --noconfirm -S pywal
fi

# Install login prompt and init pywal
# sudo cp ./issue /etc/issue

wal -q -i ./wallpapers/

echo "Done! now do ./2-symlink.sh for the symbolics links!"