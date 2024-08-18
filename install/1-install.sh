#!/bin/sh

# . = source
# avoiding "bashims" 
# so now is POSIX-compliant

# ----------------------------------------------------------------------------------------- #
. ./installer.sh
. ./packages.sh

# Check if yay is installed
# ----------------------------------------------------------------------------------------- #
clear
echo "Checking if yay is installed..."
echo ""
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
install_packages_aur $packages_aur;

echo "Install nvidia drivers? [y/N] "
read yn
case $yn in
	[yY])
		install_packages_pacman $nvidia_drivers
		;;
	*)
		echo "Skipping..."
		;;
esac

echo "Install bluetooth related packages?"
case $yn in
	[yY])
		install_packages_pacman $bluetooth
		;;
	*)
		echo "Skipping..."
		;;
esac

echo "Install optional packages? [y/N]"
read yn
case $yn in
	[yY])
		install_packages_pacman $optional_packages_pacman
		install_packages_aur $optional_packages_aur
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

# Init pywal
wal -q -i $HOME/dotfiles/wallpapers/

# Enable pipewire
if [ ! $EUID -ne 0 ]; then
	echo "Enabling pipewire and wireplumber..."
	systemctl enable --user pipewire
	systemctl enable --user wireplumber
	systemctl start --user pipewire
	systemctl start --user wireplumber
else
	echo "Please enable pipewire and wireplumber without sudo!"
	echo "Use the '--user' flag"
fi

echo "Done! now do ./2-symlink.sh for the symbolics links!"
