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
echo
if command -v yay > /dev/null 2>&1; then
	echo "yay is already installed!"
else
	echo "yay not found. Installing..."
	tmpdir=$(mktemp -d) || { echo "Failed to create temp directory"; exit 1 }
	git clone https://aur.archlinux.org/yay-git.git "$tmpdir/yay-git" || exit 1
	cd "$tmpdir/yay-git" || exit 1 
	makepkg -si --noconfirm || exit 1
	echo "yay has been installed successfully."
	cd - > /dev/null || true
	clear
	echo ""
fi

echo "-> Installing main packages"
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

echo "Done! now do ./2-symlink.sh for the symbolics links or just use stow"
