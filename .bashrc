
[[ $- != *i* ]] && return
#PS1='[\u@\h \W]\$ '
STATUS=$?
NUM_JOBS=$(jobs -p | wc -l)
PS1="$(starship prompt --status=$STATUS --jobs=$NUM_JOBS)"


# ALIASES
source ~/dotfiles/.config/zsh/aliases
# SCRIPTS


eval "$(starship init bash)"
cat ~/.cache/wal/sequences
