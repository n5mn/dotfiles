install_pacman() {
	for pkg in $1; do
		sudo pacman --noconfirm --needed -S "$pkg" || echo "Failed to install $pkg" >> "$HOME/dotfiles/packages.log"
	done
}

install_aur() {
	for pkg in $1; do
		yay --noconfirm --needed -S "$pkg" || echo "Failed to install $pkg" >> "$HOME/dotfiles/packages.log"
	done
}

symlink() {
	symlink_name="$1"
	link_source="$2"
	link_target="$3"

	backup_dir="$HOME/.config/.backup"

	mkdir -p "$backup_dir"

	if [ -e "$link_target" ] && [ ! -L "$link_target" ]; then
		cp -r "$link_target" "$backup_dir/"
		echo "Backing up $link_target to $backup_dir"
	fi

	echo "Removing existing configurations files..."
	if [ -L "$link_target" ] || [ -d "$link_target" ] || [ -f "$link_target" ]; then
		rm -rf "$link_target"
		echo "Removed $link_target"
	fi

	ln -s "$link_source" "$link_target"
	echo "$(date '+%Y-%m-%d %H:%M:%S') Symlink: $link_source -> $link_target created (Named: $symlink_name)." >> "$HOME/dotfiles/symlinks.log"
}

install_pywal() {
	if ! command -v pipx >/dev/null 2>&1; then
		echo "pipx not found, installing..."
		sudo python3 -m pip install --user pipx || { echo "Failed to install pipx"; exit 1; }
	fi

	if command -v wal > /dev/null 2>&1;then
		echo "pywal already installed."
	else
		echo "Installing pywal..."
		pipx install pywal16 --force || { echo "Failed to install pywal"; exit 1 }
	fi
}
