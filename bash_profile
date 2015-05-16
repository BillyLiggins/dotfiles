# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export TERM=xterm-256color
export EDITOR=vim

export LOCAL=/usr/local
export MUTT_SCRIPTS=/home/shivesh/.mutt/scripts

export PYTHIA6=/home/shivesh/programs/v6_428/lib
export PYTHIA8=/home/shivesh/programs/pythia8186
export PYTHIA8DATA=$PYTHIA8/xmldoc
export ROOTSYS=/home/shivesh/programs/root53428
export GENIE=/home/shivesh/programs/GENIE_2_9_0
export LHAPATH=$GENIE/data/evgen/pdfs
# export GENIE=/home/shivesh/programs/R-2_8_0
# export LHAPATH=/usr/share/lhapdf/PDFsets

LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$LOCAL/lib:$PYTHIA6:$PYTHIA8/lib:$ROOTSYS/lib:$GENIE/lib
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$LOCAL/bin:$PYTHIA8/bin:$ROOTSYS/bin:$GENIE/bin:$MUTT_SCRIPTS

export LD_LIBRARY_PATH
export PATH

