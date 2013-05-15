# Management
alias dots="cd ~/dotfiles && vim"
alias reload='source ~/bash_profile && echo "sourced ~/.bash_profile"'
alias redot='cd ~/dotfiles && gpp && rake install; cd -'

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
alias sc="[ -f script/console ] && script/console || bundle exec rails console"
alias sdb="[ -f script/dbconsole ] && script/console --include-password || bundle exec rails dbconsole --include-password"
alias ss="[ -f script/server ] && script/server || rails server"
alias mig="rake db:migrate"
alias bi="bundle install --local"
# Bundle for Rails 2 and Rails 3
alias b2a3="bundle --local && BUNDLE_GEMFILE=Gemfile.rails3 bundle --local"

# Tests
alias rsu="rake spec:unit"
alias rsua="rake spec:unit:all"
alias rt="rake testbot:spec"

# tmux
alias ta="tmux attach"
# With tmux mouse mode on, just select text in a pane to copy.
# Then run tcopy to put it in the OS X clipboard (assuming reattach-to-user-namespace).
alias tcopy="tmux show-buffer | pbcopy"

# Servers
alias rst="touch tmp/restart.txt && echo touched tmp/restart.txt"  # Passenger

# Zendesk
alias zcstart="g classic && bundle exec foreman start -f .voice.procfile"
alias zlstart="g lotus && bundle exec rails server thin -p 3010"

# Global Protect VPN
alias global-off='sudo mv /Applications/GlobalProtect.app /Applications/GlobalProtectOFF.app && pkill -9 -f GlobalProtect'
alias global-on='sudo mv /Applications/GlobalProtectOFF.app /Applications/GlobalProtect.app'

