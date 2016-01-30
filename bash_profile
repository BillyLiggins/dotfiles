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
# export MUTT_SCRIPTS=/home/shivesh/.mutt/scripts
export SCRIPTS=/home/shivesh/Documents/scripts

export PYTHIA6=/home/shivesh/programs/v6_424/lib
# export PYTHIA8=/home/shivesh/programs/pythia8186
# export PYTHIA8DATA=$PYTHIA8/xmldoc
export ROOTSYS=/home/shivesh/programs/root_v5.34
export LOG4CPP=/home/shivesh/programs/dependencies/log4cpp
export GENIE=/home/shivesh/programs/R-2_10_0
export LHAPATH=$LOCAL/share/lhapdf

LD_LIBRARY_PATH=$GENIE/lib:$LOG4CPP/lib:$ROOTSYS/lib:$PYTHIA6:$LOCAL/lib:$LD_LIBRARY_PATH
PATH=$GENIE/bin:$ROOTSYS/bin:$SCRIPTS:$PATH

export LD_LIBRARY_PATH
export PATH

