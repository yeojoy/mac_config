###### .bash_profile
###### @author  A.J <andrwj@gmail.com>

###### about java_use > http://superuser.com/users/201460/alex
###### refs : http://superuser.com/questions/490425/how-do-i-switch-between-java-7-and-java-6-on-os-x-10-8-2

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

# HOW TO USE
# change to java jdk6, 7, or 8
# example
# $ java_use 6
function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.$1)
    export PATH=$JAVA_HOME/bin:$PATH
    java -version
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
alias subl='open /Applications/Sublime\ Text\ 3.app'
alias gl='git log --pretty=format:'\''%Cgreen(%ci) %Cred%h%Creset %C(bold blue)<%an>%Creset %s -%C(yellow)%d%Creset'\''  --abbrev-commit --graph'
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d_\d\d" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

alias ..1='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

# go to nginx conf
alias n_conf='cd /usr/local/etc/nginx'

export CLICOLOR=1
export LSCOLORS=FxGxCxDxBxegedabagaced

export JAVA_HOME=$(/usr/libexec/java_home)
export ANDROID_HOME=${HOME}/Library/Android/sdk
export NDK_HOME=/usr/local/Cellar/android-ndk/r10e
export DRACULA_HOME=${HOME}/tmp/xcode

export PATH=${PATH}:/usr/local/bin:/usr/local/sbin:/usr/local/share/python
export PATH=${PATH}:${HOME}/bin
export PATH=${PATH}:$HOME/sh:${ANDROID_HOME}/tools:${ANDROID_HOME}/platform-tools
