#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#Sudo auto complete
complete -cf sudo

#Theme for micro
export "MICRO_TRUECOLOR=1"

#Fastfetch
if [[ "$TERM" == "xterm-ghostty" && ! -f "$HOME/.fastfetch_done" ]]; then
	fastfetch
	touch "$HOME/.fastfetch_done"
fi
#Check if any terminal is still running and remove the flag file only when no other terminal processes are running
if [[ "$TERM" == "xterm-ghostty" ]]; then
trap '
if ! pgrep -x "$TERM" > /dev/null; then
	rm -f "$HOME/.fastfetch_done"
	fi
	' EXIT
fi
