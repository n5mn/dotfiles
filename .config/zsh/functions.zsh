ZSH_DIRECTORY="$HOME/dotfiles/.config/zsh"

function add_plugin() {
	local PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2- )
	if [ ! -d "$ZSH_DIRECTORY/plugins/$PLUGIN_NAME" ]; then
		git clone "https://github.com/$1" "$ZSH_DIRECTORY/plugins/$PLUGIN_NAME"
	fi   
	[ -f "$ZSH_DIRECTORY/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" ] && source "$ZSH_DIRECTORY/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh"
	[ -f "$ZSH_DIRECTORY/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh" ] && source "$ZSH_DIRECTORY/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
	[ -f "$ZSH_DIRECTORY/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin" ] && source "$ZSH_DIRECTORY/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin"
}

function nvm() {
	eval "$(fnm env)"

	if [[ "$1" == "use" && -z "$2" ]]; then
		local version
		version=$(fnm list | sed 's/^\* //' | fzf --height=10 --reverse | awk '{print $1}')

		[[ -n "$version" ]] && command fnm use "$version"

	elif [[ "$1" == "install" && -z "$2" ]]; then
		local version
		version=$(fnm list-remote | fzf --height=20 --reverse | awk '{print $1}')

		[[ -n "$version" ]] && command fnm install "$version"

	else
		command fnm "$@"
	fi
}
