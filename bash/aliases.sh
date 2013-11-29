# Management
alias dots="cd ~/dotfiles && vim"
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
alias bi="bundle --local && BUNDLE_GEMFILE=Gemfile.rails2 bundle --local"
alias be="bundle exec"

# Tests
run_rake_tests() {
  ruby $1
}
alias rt=run_rake_tests # Classic
alias bert="bundle exec rake test" # Core

# Servers
alias run_classic="g classic && BUNDLE_GEMFILE=Gemfile.rails3 bundle exec foreman start -f .voice.procfile"
alias run_lotus="g lotus && foreman start -f .voice.procfile"

# Global Protect VPN
alias global-off='sudo mv /Applications/GlobalProtect.app /Applications/GlobalProtectOFF.app && pkill -9 -f GlobalProtect'
alias global-on='sudo mv /Applications/GlobalProtectOFF.app /Applications/GlobalProtect.app'

