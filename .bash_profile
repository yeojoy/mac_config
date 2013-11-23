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
         "nothing to commit, working directory clean" ) color=${c_green};;
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
alias ls='ls -G'
alias grep='grep --color=auto'
alias subl='open /Applications/Sublime\ Text\ 2.app'
alias gl="git log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

alias n_conf='cd /usr/local/etc/nginx'

export CLICOLOR=1
#export LSCOLORS=exfxcxdxbxegedabagacad
export LSCOLORS=FxGxCxDxBxegedabagaced

# export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;35m\]\w\[\033[00m\]\$ '
# export PS1='\[\033[01;32m\]\u:\[\033[01;35m\]\w\[\033[00m\]\$ '
# export TERM=xterm-256color

export DEV_HOME=${HOME}/DevTool
export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=${DEV_HOME}/android-sdk-macosx
export DART_HOME=${DEV_HOME}dart-sdk
export TMUX_HOME=/opt/tmux

export PATH=${PATH}:/usr/local/bin:/usr/local/sbin:/usr/local/share/python
export PATH=${PATH}:$HOME/sh:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/build-tools/18.1.0
export PATH=${PATH}:${DART_HOME}/bin:${DEV_HOME}/eclipse:${TMUX_HOME}/bin
