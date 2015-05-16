# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias vi="vim"
alias root="root -l"
alias hotmail="switch_mailbox hotmail && mutt"
alias gmail="switch_mailbox gmail && mutt"

eval 'dircolors .dircolors' &>/dev/null
