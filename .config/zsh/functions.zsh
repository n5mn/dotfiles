ZSH_DOTFILES="$HOME/dotfiles/.config/zsh"

function add_plugin() {
    local PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2- )
    if [ -d "$ZSH_DOTFILES/plugins/$PLUGIN_NAME" ]; then
        source "$ZSH_DOTFILES/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
#        source "$ZSH_DOTFILES/plugins/$PLUGIN_NAME.plugin.zsh"
#        source "ZSH_DOTFILES/plugins/$PLUGIN_NAME.plugin"
    else
        git clone "https://github.com/$1" "$ZSH_DOTFILES/plugins/$PLUGIN_NAME"

    fi   
   
}

function share() {
	local	S3_OBJECT="s3://inw-transfers/$1"
	echo "Now trying to share $1"
	aws s3 cp $1 $S3_OBJECT
	
	aws s3 presign --expires-in 86400 $S3_OBJECT | wl-copy
	echo "Done!"
	echo "Copyed to clipboard"
	
}
