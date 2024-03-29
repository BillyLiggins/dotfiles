export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=10000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# # Regular
# txtblk="$(tput setaf 0 2>/dev/null || echo '\e[0;30m')"  # Black
# txtred="$(tput setaf 1 2>/dev/null || echo '\e[0;31m')"  # Red
# txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')"  # Green
# txtylw="$(tput setaf 3 2>/dev/null || echo '\e[0;33m')"  # Yellow
# txtblu="$(tput setaf 4 2>/dev/null || echo '\e[0;34m')"  # Blue
# txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"  # Purple
# txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')"  # Cyan
# txtwht="$(tput setaf 7 2>/dev/null || echo '\e[0;37m')"  # White

if [ "$color_prompt" = yes ]; then
    # PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtylw\]\$git_branch\[$txtwht\]\$git_dirty\[$txtrst\]\$\n"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    # PS1="\${debian_chroot:+(\$debian_chroot)}\u@\h:\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\n\$ "
    
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# added by Anaconda 2.3.0 installer

# Define a few Colours
BLACK='\e[0;30m'
BLUE='\e[0;34m'
GREEN='\e[0;32m'
CYAN='\e[0;36m'
RED='\e[0;31m'
PURPLE='\e[0;35m'
BROWN='\e[0;33m'
LIGHTGRAY='\e[0;37m'
DARKGRAY='\e[1;30m'
LIGHTBLUE='\e[1;34m'
LIGHTGREEN='\e[1;32m'
LIGHTCYAN='\e[1;36m'
LIGHTRED='\e[1;31m'
LIGHTPURPLE='\e[1;35m'
YELLOW='\e[1;33m'
WHITE='\e[1;37m'
NC='\e[0m' # No Color
# WELCOME SCREEN
################################################## #####

# clear

echo -ne "${LIGHTGREEN}" "Hello, $USER. today is, "; date
echo -e "${WHITE}"; cal ;
echo -ne "${CYAN}";
echo -ne "${LIGHTPURPLE}Sysinfo:";uptime ;echo ""

# added by Anaconda 2.3.0 installer
export PATH="/home/billy/anaconda/bin:$PATH"

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }


define () { curl dict://dict.org/d:${1}:wn; }
set paste

netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	/sbin/ifconfig | awk /'inet addr/ {print $4}'
	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
	echo "${myip}"
	echo "---------------------------------------------------"
}

#Dirsize - finds directory sizes and lists them for the current directory
dirsize ()
{
	du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
		egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
	egrep '^ *[0-9.]*M' /tmp/list
	egrep '^ *[0-9.]*G' /tmp/list
	rm -rf /tmp/list
}

#Copy and go to dir
cpg (){
	if [ -d "$2" ];then
		cp $1 $2 && cd $2
	else
		cp $1 $2
	fi
}

#Move and go to dir
mvg (){
	if [ -d "$2" ];then
		mv $1 $2 && cd $2
	else
		mv $1 $2
	fi
}

# added to provide scons
export PATH="/data/snoplus/softwareSL6/scons-2.3.4/script:$PATH"

# added by Anaconda2 2.4.0 installer
export PATH="/home/billy/anaconda2/bin:$PATH"

# Added by Canopy installer on 2016-01-20
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make the bash prompt show that Canopy is active, otherwise 1
# VIRTUAL_ENV_DISABLE_PROMPT=1 source '/home/billy/Enthought/Canopy_64bit/User/bin/activate'


function snoplus {
	printf "%-25s" "Loading SNO+ env..."
	export SNOING=$HOME/snoing
	export PATH=$SNOING/bin:/usr/bin:$PATH
	export MAKEFLAGS=-j$(($(nproc)-1))
	export CXXFLAGS=-D_GLIBCXX_USE_CXX11_ABI=0
	# source $SNOING/install/env_rat-dev.sh
	printf "done\n"
}

function forrat {
	printf "%-25s" "Loading SNO+ env..."
	export PATH=/usr/bin:$PATH
	export MAKEFLAGS=-j$(($(nproc)-1))
	export CXXFLAGS=-D_GLIBCXX_USE_CXX11_ABI=0
	printf "done\n"
}

# ghf - [G]rep [H]istory [F]or top ten commands and execute one
# usage:
#  Most frequent command in recent history
#   ghf
#  Most frequent instances of {command} in all history
#   ghf {command}
#  Execute {command-number} after a call to ghf
#   !! {command-number}
function latest-history { history | tail -n 50 ; }
function grepped-history { history | grep "$1" ; }
function chop-first-column { awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}' ; }
function add-line-numbers { awk '{print NR " " $0}' ; }
function top-ten { sort | uniq -c | sort -r | head -n 10 ; }
function unique-history { chop-first-column | top-ten | chop-first-column | add-line-numbers ; }
function ghf {
  if [ $# -eq 0 ]; then latest-history | unique-history; fi
  if [ $# -eq 1 ]; then grepped-history "$1" | unique-history; fi
  if [ $# -eq 2 ]; then
    `grepped-history "$1" | unique-history | grep ^$2 | chop-first-column`;
  fi
}

stty -ixon

. /usr/local/bin/virtualenvwrapper.sh

function mkvenv(){
    mkvirtualenv $*
    setvirtualenvproject
    pip install -r requirements.txt
}

function hlr(){
    heroku local:run $*
}

alias vimm='/usr/bin/vim'
alias vii='/usr/bin/vim'
alias vim='nvim'
alias vi='nvim'

# Map caps lock to escape
#setxkbmap -option caps:escape

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export PATH="$PATH:/home/billy/development/flutter/bin"
export PATH="$PATH:/home/billy/packages/node-v10.16.3-linux-x64/bin/"

# function tag-lib() {
#     if [ -z "$1" ]
#       then
#         echo "No release version supplied. Use 'release-lib major.minor.patch'"
#         return 1
#     fi
#     git fetch
#     git checkout ci
#     git pull
#     git reset --hard origin/ci
#     git checkout -b "release-$1"
#     scripts/set_version.sh $1
#     git commit -a -m "Increment version to $1"
#     git checkout master
#     git reset --hard origin/master
#     git merge "release-$1" --no-ff
#     git tag $1 -a
#     scripts/distribute.sh
#     git push origin master $1
#     echo "Released $1 - Now pull request from master into ci"
# }

function woh(){
    workon `basename $PWD`
}
function mkvenvh(){
    mkvenv `basename $PWD`
}
function rmvirtualenvh(){
    rmvirtualenv `basename $PWD`
}

function release-lib() {
    if [ -z "$1" ]
      then
        echo "No release version supplied. Use 'release-lib major.minor.patch'"
        return 1
    fi
    git fetch
    git checkout ci
    git pull
    git reset --hard origin/ci
    git checkout -b "release-$1"
    scripts/set_version.sh $1
    git commit -a -m "Increment version to $1"
    git checkout master
    git reset --hard origin/master
    git merge "release-$1" --no-ff
    git tag $1 -a
    scripts/distribute.sh
    git push origin master $1
    echo "Released $1 - Now pull request from master into ci"
}
export TWINE_REPOSITORY=yopy

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
# source /etc/profile.d/undistract-me.sh

function git-work() {
    ssh-add -D
    ssh-add ~/.ssh/id_rsa_work_user1
}

function git-personal() {
    ssh-add -D
    ssh-add ~/.ssh/id_rsa
}
git-up () {

  TEMP_PWD=`pwd`
  while ! [ -d .git ]; do
  cd ..
  done
  OLDPWD=$TEMP_PWD

}
function _fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

# Use fd to generate the list for directory completion
function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
export PATH="/home/billy/packages/git-fuzzy/bin:$PATH"
. /home/billy/packages/z/z.sh

export PATH="/home/billy/packages/diff-so-fancy/:$PATH"
export PATH="$HOME/.poetry/bin/:$PATH"
export PATH="/home/billy/.local/bin:$PATH"
