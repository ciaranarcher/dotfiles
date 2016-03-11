# Management
alias dots="cd ~/dotfiles && vim"
alias reload='source ~/.zshrc && echo "sourced ~/.zshrc"'

# OS X: open pwd in Finder.
alias o="open ."
# Open another instance of an application, e.g. ITerm
alias openanother="open -n -a"
# vim
alias v="vim"

alias hosts='sudo vim /etc/hosts'

# Shell
alias la='ls -alh'
alias cdd='cd -'  # back to last directory
alias pg='ps aux | grep '
alias top='top -ocpu'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Portable ls with colors
# if ls --color -d . >/dev/null 2>&1; then
#   alias ls='ls --color=auto'  # Linux
# elif ls -G -d . >/dev/null 2>&1; then
#   alias ls='ls -G'  # BSD/OS X
# fi

# Ruby on Rails
alias mig="rake db:migrate"
alias bi="bundle --local"
alias be="bundle exec"

alias bert="bundle exec rake test"
alias vf="gclassic && ./script/feature list | grep voice" # List all voice features
alias tf="tail -f log/development.log"
alias scrub="git reset --hard HEAD && git clean -fd"

alias gclassic="cd ~/Code/zendesk/zendesk"
alias gvoice="cd ~/Code/zendesk/voice"
alias glotus="cd ~/Code/zendesk/zendesk_console"
alias gmaestro="cd ~/Code/go/src/github.com/zendesk/maestro"

