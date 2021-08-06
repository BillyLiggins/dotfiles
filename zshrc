
# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="random"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(tmux git z docker vagrant python aws django zsh-autosuggestions )#vi-mode)



# User configuration

# export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export VIRTUALENVWRAPPER_PYTHON="/usr/local/bin/python3"
export WORKON_HOME="${HOME}/.virtualenvs"
export PROJECT_HOME="${HOME}/workspace"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshrc="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh/oh-my-zsh.sh"

if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

. /usr/local/bin/virtualenvwrapper.sh
function mkvenv(){
    mkvirtualenv $*
    setvirtualenvproject
    pip install -r requirements.txt
}
function hlr(){
    heroku local:run $*
}

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
	export SNOING=$HOME/snoing
	export PATH=$SNOING/bin:/usr/bin:$PATH
	export MAKEFLAGS=-j$(($(nproc)-1))
	export CXXFLAGS=-D_GLIBCXX_USE_CXX11_ABI=0
	printf "done\n"
}

# stty -ixon

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias vimm='/usr/bin/vim'
alias vii='/usr/bin/vim'
alias vim='nvim'
alias vi='nvim'

# Map caps lock to escape
# setxkbmap -option caps:escape

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="$PATH:/home/billy/development/flutter/bin"
export PATH="$PATH:/home/billy/packages/node-v10.16.3-linux-x64/bin/"

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
# source ~/.bashrc.local
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
alias gu="git-up"
function gfc() {
    git fetch origin $1:$1;
    git co $1
}
function gfci() {
    git fetch origin ci:$1;
    git co $1
}
function gfcm() {
    git fetch origin master:$1;
    git co $1
}
export PATH="${HOME}/packages/git-fuzzy/bin:$PATH"
export PATH="${HOME}/packages/diff-so-fancy/:$PATH"
. ${HOME}/packages/z/z.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



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

export PATH="$HOME/.poetry/bin:$PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  # source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
