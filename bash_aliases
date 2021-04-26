#For QMUL Computers.
# if [[ $(hostname) = "heppc400.ph.qmul.ac.uk" ]]; then 
if [[ $(hostname) = "heppc"* ]]; then 


	# Added by Canopy installer on 2016-01-20
	# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make the bash prompt show that Canopy is active, otherwise 1
	alias activate_canopy="source '/users/liggins/Enthought/Canopy_64bit/User/bin/activate'"
	# VIRTUAL_ENV_DISABLE_PROMPT=1 source '/users/liggins/Enthought/Canopy_64bit/User/bin/activate'

	# added by Anaconda2 4.0.0 installer
	export PATH="/data/snoplus/liggins/python/anaconda2/bin:$PATH"
        #Set up varibles to access data on grid.
        export MYPROXY_SERVER=myproxy.gridpp.rl.ac.uk
        export LFC_HOST=lfc.gridpp.rl.ac.uk
        export LCG_GFAL_INFOSYS=lcgbdii.gridpp.rl.ac.uk:2170

	export PATH="/users/liggins/local/bin:$PATH"
	# This is your own latex TexLive 2016
	export PATH=/data/snoplus/liggins/packages/install-tl-20160620/bin/x86_64-linux:$PATH
	export PATH="/users/liggins/usr/bin:$PATH"
	source ~/.git-completion.bash
        #This is for vim.
        export PATH="/user/liggins/usr/bin/:$PATH"

	alias me='liggins@hep.ph.qmul.ac.uk'
	alias open='gnome-open'
	alias in='ssh liggins@hep.ph.qmul.ac.uk'
	alias in400='ssh heppc400 -XY'
	alias in401='ssh heppc401 -XY'
	alias in402='ssh heppc402 -XY'
	alias in403='ssh heppc403 -XY'
	alias in404='ssh heppc404 -XY'
	alias in405='ssh heppc405 -XY'
	alias in406='ssh heppc406 -XY'
	alias in407='ssh heppc407 -XY'
	alias s1='cd /data/liggins/SummerInternship/BiPo/billSims'
	alias srat='source /data/snoplus/softwareSL6/env_rat-6.1.0.sh'
	alias cssrat='source /data/snoplus/liggins/year1/CSS/rat/css_rat.sh'
	alias y1='cd /data/snoplus/liggins/year1'
	alias phd='cd /data/snoplus/liggins/year1'
	alias css='cd /data/snoplus/liggins/year1/CSS'
	alias report='cd ~/Documents/reports/'
	alias fit='cd /data/snoplus/liggins/year1/fitting'
	alias mark='cd /data/hays/Teaching/2015-16/marking/SectionC/'
	alias in400x='ssh -XY heppc400'
	alias ech='source /data/snoplus/liggins/year1/fitting/virtualenv-14.0.5/echidna/bin/activate'
	alias ~ech='deactivate'
	alias mem='cd /data/snoplus/liggins/year1/memoryLeaks/'
	alias vi='vim'
	alias lt='ls -lrt'
        alias batch='source /opt/sge/default/common/settings.sh'
        alias scons='echo scons -j44 && scons -j44'
	source /opt/sge/default/common/settings.sh
fi

#From Laptop
if [[ $(hostname) = "billy-Inspiron-5423" || $(hostname) = "billy-Vostro-430" || $(hostname) = "billy-Lenovo-ideapad-100S-11IBY" ]]; then 
	alias open='xdg-open'
	alias install='apt-get install'
	alias inx='ssh -XY liggins@hep.ph.qmul.ac.uk '
	alias in='ssh liggins@hep.ph.qmul.ac.uk'
	alias phd='cd ~/workspace/PhD'
	alias oxsx='cd ~/workspace/PhD/oxsx'
	alias report='cd ~/workspace/PhD/Reports/'
	alias writeup='cd ~/workspace/PhD/Reports/WriteUps/'
	alias fit="cd ~/workspace/PhD/fitting"
	alias srat="source ~/snoing/install/env_rat-dev.sh"
	# alias sroot="source ~/root/bin/thisroot.sh"
	alias sroot="source /home/billy/workspace/PhD/packages/rootBulid/bin/thisroot.sh"
	alias lt='ls -lrt'
fi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias rc="vim ~/.bashrc"
alias rca="vim ~/.bash_aliases"
alias vrc="vim ~/.vimrc"
alias vrc="vim ~/.config/nvim/init.vim"
alias today='grep -h -d skip `date +%m/%d` /usr/share/calendar/*'

alias bbc='lynx http://news.bbc.co.uk/text_only.stm'
alias nytimes='lynx http://nytimes.com'
alias weather='curl http://wttr.in/'
alias starwars='telnet towel.blinkenlights.nl'
alias m='less'
alias lg='logout'
alias mm='more'
alias m='less'
alias o="xdg-open"
alias open="xdg-open"

alias vi="nvim"
alias vim="nvim"
alias vii="/usr/bin/vim"
alias vimm="/usr/bin/vim"

# toggle caps lock
alias capslock="xdotool key Caps_Lock"

alias x=exit
alias clip="xclip -selection c"

# Git shortcuts
## spelling
alias gti="git"

alias ga="git add"
alias gd="git diff"
# alias gh="git hist"
alias gp="git push"
alias gs="git st"
alias gsf="git st | fpp"
alias gc="git co"
alias gb="hub browse"
alias gr="git reset --hard"
alias lastcommit="git commit --amend"
alias br_ls="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias wo="workon"
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir -p $1 && cd $1
  fi
}
# python
alias python="python3"
alias p="python"
alias p2="python2"
alias p3="python3"

# Vagrant

alias vp="time vagrant provision; aplay /usr/share/sounds/sound-icons/hash; notify-send 'VM provisioned !!'"
alias vu="time vagrant up; aplay /usr/share/sounds/sound-icons/hash; notify-send 'VM up and maybe provisioned !!'"
alias vs="vagrant ssh"
alias vgs="vagrant global-status"
alias vd="vagrant destroy"
alias vdf="vagrant destroy -f"
alias vh="vagrant halt"

# heroku
alias hl="heroku local"
alias refreshrds="time heroku run refresh -a yo-rds-billy"
alias simlog='heroku logs -t -a yobota-simulation-integrations'
# tmux
alias ta="tmux a"
alias tl='tmux list-sessions'
alias t='tmux attach || tmux new-session'


# rgrep
alias rgrep="rgrep -nI --color --exclude=tags"
alias rgerp="rgrep"
alias rgrrp="rgrep"
alias rgeep="rgrep"
alias gerp="grep"
alias grrp="grep"
alias geep="grep"

# Quick find
function f() {
    echo "find . -iname \"*$1*\""
    find . -iname "*$1*"
}


# Quick find
function tag() {
    echo "# release integrations"
    echo "* pip install twine==1.11.0"
    echo "* on master"
    echo "* git tag x.y.z -a (Version x.y.z message)"
    echo "* git push --tags"
    echo "* python setup.py build bdist_wheel"
    echo "* twine upload dist/x.y.z -r yopy"
    echo ""
}
alias tree="tree -I 'CVS|.git|*~'"

# bookmarks
alias jira="bm jira"

# ls
alias ls="ls -h --color "

alias aws_ls_stubs="aws s3 ls --human-readable s3://yobota-simulation-stubs/ --profile simulation-stubs | sort"
alias aws_ls_ipython="aws s3 ls --human-readable s3://yobota-ipython-simulation/output/ --profile ipython | sort"
alias req="vi requirements.txt"

source ~/.docker_alias_rc
