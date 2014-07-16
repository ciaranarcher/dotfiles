# Management
alias dots="cd ~/dotfiles && subl ."
alias reload='source ~/.bash_profile && echo "sourced ~/.bash_profile"'

# OS X: open pwd in Finder.
alias o="open ."
# Open another instance of an application, e.g. ITerm
alias openanother="open -n -a"

alias hosts='sudo vim /etc/hosts'

# Shell
alias la='ls -alh'
alias cdd='cd -'  # back to last directory
alias pg='ps aux | grep '
alias tf='tail -F -n200'
alias top='top -ocpu'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Portable ls with colors
if ls --color -d . >/dev/null 2>&1; then
  alias ls='ls --color=auto'  # Linux
elif ls -G -d . >/dev/null 2>&1; then
  alias ls='ls -G'  # BSD/OS X
fi

# Ruby on Rails
alias mig="rake db:migrate"
alias bi="bundle --local"
alias be="bundle exec"

alias bert="bundle exec rake test"
alias vf="g classic && ./script/feature list | grep voice" # List all voice features
alias tf="tail -f log/development.log"

# Boxen
alias bounce="touch tmp/restart.txt && echo 'Server will bounce at next request.'"
alias run_radar="g radar && npm rebuild && npm start"
alias run_voice="g voice && bundle exec foreman start -f Procfile.boxen"
alias update_all="g boxen && script/update-all ~/Code/zendesk"

# Global Protect VPN
alias global-off='sudo mv /Applications/GlobalProtect.app /Applications/GlobalProtectOFF.app && pkill -9 -f GlobalProtect'
alias global-on='sudo mv /Applications/GlobalProtectOFF.app /Applications/GlobalProtect.app'

# Sonic
alias zd=$HOME/Code/zendesk/zendesk_sonic/bin/zd
