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
alias hotmail="switch_mailbox hotmail && mutt"
alias gmail="switch_mailbox gmail && mutt"
alias cern="switch_mailbox cern && mutt"
alias open="gnome-open"
alias steam-wine="wine /home/shivesh/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-dwrite >/dev/null 2>&1 &"

eval 'dircolors .dircolors' &>/dev/null
