ZSH_DOTFILES="$HOME/dotfiles/zsh"

function add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2- )
    if [ -d "$ZSH_DOTFILES/plugins/$PLUGIN_NAME" ]; then
        source "$ZSH_DOTFILES/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
#        source "$ZSH_DOTFILES/plugins/$PLUGIN_NAME.plugin.zsh"
#        source "ZSH_DOTFILES/plugins/$PLUGIN_NAME.plugin"
    else
        git clone "https://github.com/$1" "$ZSH_DOTFILES/plugins/$PLUGIN_NAME"

    fi   
   
}
