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
alias wine="/home/shivesh/Documents/scripts/launch_scripts/wine.sh"
alias winetricks="sudo -u spyke /usr/bin/winetricks"
alias starcraft="/home/shivesh/Documents/scripts/launch_scripts/battle.net.sh"

alias qmul="ssh -XYA mandalia@heppc101.ph.qmul.ac.uk"
alias icecube="ssh -XYA smandalia@pub.icecube.wisc.edu"

export LS_COLORS=""
eval $(dircolors ~/.dircolors) &>/dev/null
