# Enable Powerlevel10k instant prompt. {{{
# Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}

# {{{
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="lambda"
CASE_SENSITIVE="true"

plugins=(git)
source $ZSH/oh-my-zsh.sh
HISTFILE=$HOME/logs/.zsh_history

# disable oh-my-zsh shit when root 
export ZSH_DISABLE_COMPFIX=true

if [[ "$ZSH_DISABLE_COMPFIX" != true ]]; then
  source "$ZSH/lib/compfix.zsh"
  compinit -i -d "$ZSH_COMPDUMP"
  handle_completion_insecurities &|
else
  compinit -u -d "$ZSH_COMPDUMP"
fi
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
fi

#}}}

##### Aliases {{{ 
alias grep='grep --color=auto'
alias c='clear'
alias la='ls -lah'
alias dc='docker-compose'
alias ll='ls -lh --color=auto' 
alias gtc='~/Scripts/utils/gtc.sh'

source ~/r2
alias r2='aws s3 --endpoint-url $R2_ENDPOINT'
alias notes='vim ~/Notes/Credentials.md'
alias rdunst='killall dunst && notify-send config reloaded'
alias dot='cd ~/dotfiles'

# Git
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gcl='git clone'
alias ownR='sudo chown -R $USER:$USER'
alias own='sudo chown $USER:$USER'

# Root
alias root='sudo -E zsh'

alias fixP='sudo ~/Scripts/utils/fixPermissions.sh'
# Functions


# }}}
source ~/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 
source ~/.bash_profile

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

