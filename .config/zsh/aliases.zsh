#!/bin/sh

# Common commands {{{
alias rm="rm -vI" # I don't trust myself anymore
alias mv="mv -iv"
alias cp="cp -iv"
alias ls='LC_COLLATE=C ls --color=always --group-directories-first'
alias grep='grep --color=auto'
alias c='clear'
alias la='ls -lah'
alias l='ls -lh'
alias dc='docker-compose'
alias untar="tar -cvzf"
alias notes='cd ~/Notes/ && nvim .'
alias dot='cd ~/dotfiles'
alias own='sudo chown $USER:$USER'
alias ownR='sudo chown -R $USER:$USER'
alias root='sudo -E zsh'
alias ivm='nvim'
alias vmi='nvim'
alias vim='nvim'
alias vi='/usr/bin/vim'
alias :q='exit'
alias SS='sudo systemctl'
alias neofetch='fastfetch'
alias kubectl='minikube kubectl --' 
alias tf='terraform'
alias current_date='date +"%Y-%m-%d_%H-%M"'
# }}}

if [ -f ~/r2 ]; then
	source ~/r2
	alias r2='aws s3 --profile r2 --endpoint-url $R2_ENDPOINT'
fi

alias g='lazygit'
