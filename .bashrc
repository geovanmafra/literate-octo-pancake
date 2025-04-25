#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
complete -cf sudo

#Fastfetch ASCII
if [[ "$TERM" == "xterm-ghostty" && ! -f "$HOME/.fastfetch_done" ]]; then
	fastfetch
	touch "$HOME/.fastfetch_done"
fi
#Check if terminal is running and remove the flag file
if [[ "$TERM" == "xterm-ghostty" ]]; then
	trap "rm -f .fastfetch_done" EXIT
fi
