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

