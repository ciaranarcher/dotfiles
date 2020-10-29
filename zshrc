# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd/mm/yyyy"

# History settings
unsetopt inc_append_history
unsetopt share_history


# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=~/dotfiles/zsh_custom

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git vi-mode jsontools zsh-autosuggestions)

# User configuration

# export PATH=":/usr/local/mysql/bin:/var/lib/gems/1.8/bin:/usr/local/bin:/Users/carcher/.bin:bin:node_modules/.bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# path+=('/Users/carcher/.rbenv/bin')
# export PATH

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# source ~/dotfiles/bash/aliases.sh
# source ~/dotfiles/bash/functions.sh
# source ~/.local/bin/bashmarks.sh

export ZENDESK_ROOT=~/Code/zendesk
export ZENDESK_CODE_DIR=~/Code/zendesk
export ZENDESK_PORT=''
export BIMEIO=~/Code/zendesk/explore
export NGROK_REGION="eu"
export ZDI_UPDATE_PARALLEL=true

# Used to docker images to mount $GOPATH
export DOCKER_IMAGES_MOUNT_GOPATH=true
export DOCKER_VM_CPUS=2
export DEDICATED_DOCKER_DISK=true

# vi mode edit
set -o vi

# Editor
export EDITOR='vim'

# Incremental search
bindkey -v
bindkey '^R' history-incremental-search-backward
PATH=/usr/local/anaconda3/bin:/usr/local/mysql/bin:/var/lib/gems/1.8/bin:/usr/local/bin:~/.bin:bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:~/Code/go/bin:/Users/carcher/Library/Python/3.6/bin:~/.rbenv/shims
export PATH="/usr/local/opt/go@1.6/bin:$PATH" # required to use go1.6 (https://gist.github.com/ciaranarcher/d3ba5150c6b48ebdfcae5cd9123557fd)

source ~/.zshrc.sensitive

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# added by travis gem
[ -f ~/.travis/travis.sh ] && source /Users/carcher/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '~/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/carcher/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '~/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/carcher/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# jenv support (manually added)
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# BEGIN ZDI
export DOCKER_FOR_MAC_ENABLED=true
source /Users/carcher/Code/zendesk/zdi/dockmaster/zdi.sh
# END ZDI

# AWS support
autoload bashcompinit
bashcompinit
source /Users/carcher/Code/zendesk/dotfiles_n_scripts/shell_scripts/aws-exec.bash

