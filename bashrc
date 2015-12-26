# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

shopt -s direxpand

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi="vim"
alias root="root -l"
alias grep="grep --color=auto"
alias open="xdg-open"
alias spotify="/home/shivesh/Documents/scripts/launch_scripts/spotify.sh"
alias skype="/home/shivesh/Documents/scripts/launch_scripts/skype.sh"

export LS_COLORS=""
eval $(dircolors ~/.dircolors) &>/dev/null
