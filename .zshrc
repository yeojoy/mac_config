# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/yeojoy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="muse"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


##########
# alias
##########
# alias ls='ls -G'
alias ll='ls -alt'
alias la='ls -la'
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
alias gd='git --no-pager diff'
alias gds='git --no-pager diff --staged'
alias gdn='git --no-pager diff --name-status'
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

# go to current workspace
alias cdw='cd $HOME/workspace/dakiadigital/mobile/andoid/TBDMusicApp'

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

