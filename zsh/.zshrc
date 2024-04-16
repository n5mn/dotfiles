# Enable Powerlevel10k instant prompt. {{{
# Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}

# History in cache directory: {{{
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/.zsh_history

# }}}

# Aliases {{{
source ~/dotfiles/zsh/aliases
# }}}

# Options {{{
unsetopt menu_complete
unsetopt flowcontrol

setopt prompt_subst
setopt always_to_end
setopt append_history
setopt auto_menu
setopt complete_in_word
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history

autoload -U compinit 
compinit

if [ -z "$ZSH_COMPDUMP" ]; then
  ZSH_COMPDUMP="${ZDOTDIR:-${ZSH}}/cache/.zcompdump"
fi

# }}}

# Theme/plugins {{{
source ~/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/dotfiles/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/dotfiles/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

zstyle ':completion:*' menu select

# }}}

# Binds {{{

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char 

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# }}}

# To customize prompt, run `p10kconfigure` or edit ~/dotfiles/zsh/.p10k.zsh. {{{

source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/dotfiles/zsh/.p10k.zsh ]] || source ~/dotfiles/zsh/.p10k.zsh
# }}}
