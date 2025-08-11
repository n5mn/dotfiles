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
alias root='sudo -E zsh'
alias ivm='nvim'
alias vmi='nvim'
alias vim='nvim'
alias vi='/usr/bin/vim'
alias :q='exit'
alias kubectl='minikube kubectl --' 
alias tf='terraform'
alias current_date='date +"%Y-%m-%d_%H-%M"'
# }}}


alias g='lazygit'
