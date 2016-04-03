# .bash_profile

# Source global profile
if [ -f /etc/profile ]; then
	. /etc/profile
fi

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export TERM=xterm-256color
export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export LANG=en_US.UTF-8

export LOCAL=/usr/local
export SCRIPTS=/home/shivesh/Documents/scripts

LD_LIBRARY_PATH=$LOCAL/lib:$LD_LIBRARY_PATH
PATH=$LOCAL/bin:$SCRIPTS:$PATH

export LD_LIBRARY_PATH
export PATH

