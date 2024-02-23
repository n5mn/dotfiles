#!/bin/bash
# ----------------------------------------------------------------------------------------- #
source ./install/installer.sh
source ./install/yay.sh
source ./install/pacman.sh
source ./install/zsh.sh

# Check if yay is installed
# ----------------------------------------------------------------------------------------- #

if [[ -x $(command -v yay) ]]; then
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

nvidiaDrivers

echo "-> Installing main packages"

# ----------------------------------------------------------------------------------------- #
# Install packages from official repositories and AUR
installPackagesPacman "${packagesPacman[@]}";
installPackagesYay "${packagesYay[@]}";

echo "Install optional packages? [y/N]"
read -r yn
if [[ $yn =~ ^[yY]$ ]]; then
    installPackagesPacman "${optionalPackagesPacman[@]]}"
else 
    echo "Skipping..."
fi

# Install pywal
if [ -f /usr/bin/wal ]; then
    echo "pywal already installed."
else
    yay --noconfirm -S pywal
fi

sudo systemctl enable --now bluetooth

# Install login prompt and init pywal
sudo cp ./issue /etc/issue
wal -i ./wallpapers/default.jpg

echo "Finished! Do a sudo reboot."