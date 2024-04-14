
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '


# ALIASES
alias c='clear'
alias nf='neofetch'
alias pf='pfetch'
alias ls='ls --color=auto'
alias la='ls -lah'
alias shutdown='systemctl poweroff'
alias wifi='nmtui'
alias winclass="xprop | grep 'CLASS'"
alias dot="cd ~/dotfiles"
alias matrix="cmatrix -r -b -a -u 3"

# GIT
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gpl="git pull"

# SCRIPTS
alias confb='nvim ~/dotfiles/.bashrc'
alias wallp='exec ~/dotfiles/waybar/launch.sh'

alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
eval "$(starship init bash)"
cat ~/.cache/wal/sequences
