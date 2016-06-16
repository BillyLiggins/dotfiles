#For QMUL Computers.
# if [[ $(hostname) = "heppc400.ph.qmul.ac.uk" ]]; then 
if [[ $(hostname) = "heppc"* ]]; then 

	alias me='liggins@hep.ph.qmul.ac.uk'
	alias in='ssh liggins@hep.ph.qmul.ac.uk'
	alias in400='ssh heppc400 -XY'
	alias s1='cd /data/liggins/SummerInternship/BiPo/billSims'
	alias srat='source /data/snoplus/softwareSL6/env_rat-5.3.1.sh'
	alias cssrat='source /data/snoplus/liggins/year1/CSS/rat/css_rat.sh'
	alias y1='cd /data/snoplus/liggins/year1'
	alias css='cd /data/snoplus/liggins/year1/CSS'
	alias fit='cd /data/snoplus/liggins/year1/fitting'
	alias mark='cd /data/hays/Teaching/2015-16/marking/SectionC/'
	alias in400x='ssh -XY heppc400'
	alias ech='source /data/snoplus/liggins/year1/fitting/virtualenv-14.0.5/echidna/bin/activate'
	alias ~ech='deactivate'
	alias mem='cd /data/snoplus/liggins/year1/memoryLeaks/'
	source /opt/sge/default/common/settings.sh

	# Added by Canopy installer on 2016-01-20
	# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make the bash prompt show that Canopy is active, otherwise 1
	alias activate_canopy="source '/users/liggins/Enthought/Canopy_64bit/User/bin/activate'"
	# VIRTUAL_ENV_DISABLE_PROMPT=1 source '/users/liggins/Enthought/Canopy_64bit/User/bin/activate'

	# added by Anaconda2 4.0.0 installer
	export PATH="/data/snoplus/liggins/python/anaconda2/bin:$PATH"

	export PATH="/users/liggins/local/bin:$PATH"
	source ~/.git-completion.bash





fi

#From Laptop
if [[ $(hostname) = "billy-Inspiron-5423" ]]; then 
	alias open='xdg-open'
	alias install='apt-get install'
	alias inx='ssh liggins@hep.ph.qmul.ac.uk -XY'
	alias in='ssh liggins@hep.ph.qmul.ac.uk'
	alias phd='cd ~/workspace/PhD'
	alias fit="cd ~/workspace/PhD/fitting"
	alias srat="source ~/snoing/install/env_rat-dev.sh"
	alias sroot="source ~/root/bin/thisroot.sh"
	export PYTHONPATH=/home/billy/echidna:$PYTHONPATH
fi

alias com='sh bin/compile.sh'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias rc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias today='grep -h -d skip `date +%m/%d` /usr/share/calendar/*'

alias bbc='lynx http://news.bbc.co.uk/text_only.stm'
alias nytimes='lynx http://nytimes.com'
alias whether='curl http://wttr.in/'
alias starwars='telnet towel.blinkenlights.nl'
alias m='less'
alias lg='logout'
alias mm='more'
alias m='less'
