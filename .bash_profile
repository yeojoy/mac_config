###### .bash_profile
###### @author  A.J <andrwj@gmail.com>

###### display 'git status' in bash prompt line (PS1)
c_cyan=`tput setaf 6`
c_dark=`tput setaf 0`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_pink=`tput setaf 5`
c_sgr0=`tput sgr0`

color30='\[\e[1;30m\]'
color32='\[\e[1;32m\]'
color33='\[\e[1;33m\]'
eend='\[\e[0m\]'

parse_branch ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      branchname="("$(branch_color)$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')${c_sgr0}") "
   else
      return 0
   fi 
   echo -e $branchname
}

branch_color ()
{
   color=""
   if git diff --quiet 2>/dev/null >&2
   then
      gitstatus=$(git status 2>/dev/null| tail -n1)
      case "$gitstatus" in
         "nothing to commit, working tree clean" ) color=${c_green};;
         * ) color=${c_pink};;
      esac
   else
     color=${c_red}
   fi 
   echo -ne $color
}

export PS1='@\[\e[1;32m\]\u\[\e[0m\]\[${c_sgr0}\]:\w\[${c_sgr0}\]\[$(parse_branch)\]\[\e[0m\]> '

###### General 
export EDITOR=/usr/bin/vim
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

###### Node Version Manager
###### 'NVM_NODE_VERSION': https://github.com/andrwj/nvm
if [[ -s "$HOME/.nvm/nvm.sh" ]]; then
	export NVM_DIR="$HOME/.nvm"
	source "$HOME/.nvm/nvm.sh"
	export NODE_PATH="$HOME/.nvm/`nvm_version`/lib/node_modules/"
	[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
else
#	export NODE_PATH=/usr/lib/node_modules/
  echo
fi	

###### Perl Version Manager
[[ -s  "$HOME/perl5/perlbrew/etc/bashrc" ]] && source "$HOME/perl5/perlbrew/etc/bashrc"

###### Ruby Version Manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


###### for python virtual environments
if [[ -e "$HOME/.virtualenvs" ]]; then
	export WORKON_HOME=$HOME/.virtualenvs
	export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python2.7
	export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'
	export PIP_VIRTUALENV_BASE=$WORKON_HOME
	export PIP_RESPECT_VIRTUALENV=true
	if [[ -r /usr/local/share/python/virtualenvwrapper.sh ]]; then
		source /usr/local/share/python/virtualenvwrapper.sh
	else
		echo "WARNING: Can't find virtualenvwrapper.sh"
	fi
fi

###### enabling vim key-binding in commandline
set -o vi


##########  
# alias
##########  
# alias ls='ls -G'
alias ll='ls -alt'
alias grep='grep --color=auto'
# alias subl='open /Applications/Sublime\ Text\ 3.app'
alias ad='adb devices'
alias python='python3'
alias pip='pip3'

alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

# git alias
# git log
alias gll='git log --pretty=format:'\''%Cgreen(%ci) %Cred%h%Creset %C(bold blue)<%an>%Creset %s -%C(yellow)%d%Creset'\''  --abbrev-commit --graph'
alias gl='git log --pretty=format:'\''%C(bold red)%h%C(reset) : %C(bold green)(%ar : %ci)%C(reset) - %C(cyan)<%an>%C(reset)%C(bold yellow)%d%C(reset)%n%n%w(90,1,2)%C(white)%B%C(reset)%n'\''  --abbrev-commit --graph'
alias gs='git status'
alias gfu='git fetch upstream'
# git diff
alias gd='git diff'
alias gds='git diff --staged'
alias gdn='git diff --name-status'
alias grpo='git remote prune origin'
alias gaa='git add -A'
alias gcm='git commit -m'
alias gb='git branch -a'
# git remote
alias grv='git remote -v'
alias grsu='git remote set-url'
# git rebase
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gra='git rebase --abort'
# git reset
alias grh='git reset --hard'

# go to nginx conf
alias n_conf='cd /usr/local/etc/nginx'

export CLICOLOR=1
export LSCOLORS=FxGxCxDxBxegedabagaced

export ANDROID_HOME=${HOME}/sdk/android
export NDK_HOME=/usr/local/Cellar/android-ndk/r10e
export DRACULA_HOME=${HOME}/tmp/xcode
export JAVA_HOME=/Applications/Android\ Studio.app/Contents/jre/jdk/Contents/Home
export GO_HOME=${HOME}/go/bin

export PATH=${PATH}:/usr/local/bin:/usr/local/sbin:/usr/local/share/python
export PATH=${PATH}:${HOME}/bin
export PATH=${PATH}:${JAVA_HOME}/bin
export PATH=${PATH}:$HOME/sh:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:${GO_HOME}
