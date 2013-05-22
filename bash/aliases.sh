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

# Git - find out where a particular commit is
function fsha() {
  if [[ "$@" != "" ]]; then
    git fetch
    for hash in $@;do
        echo $hash;
        git branch -a --contains $hash | grep 'master\|staging\|production';\
    done;
  else
    echo "You must give a hash argument.";
  fi
}

# Copy last git commit to clipboard
function csha() {
  sha=`git rev-parse HEAD | tr -d '\n'`
  printf $sha | pbcopy
  echo "Copied '$sha' to clipboard."
}

# Copy current Git branch name
function cbr() {
  br=`git rev-parse --abbrev-ref HEAD | tr -d '\n'`
  printf $br | pbcopy
  echo "Copied '$br' to clipboard."
 }

# Portable ls with colors
if ls --color -d . >/dev/null 2>&1; then
  alias ls='ls --color=auto'  # Linux
elif ls -G -d . >/dev/null 2>&1; then
  alias ls='ls -G'  # BSD/OS X
fi

# Ruby on Rails
alias mig="rake db:migrate"
alias bi="bundle install --local"
alias b2a3="bundle --local && BUNDLE_GEMFILE=Gemfile.rails3 bundle --local" # Bundle for Rails 2 and Rails 3

# Tests
run_rake_tests() {
  rake test TESTOPTS="-v" TEST=$1

}
alias rt=run_rake_tests

# Servers
alias zcstart="g classic && bundle exec foreman start -f .voice.procfile"
alias zlstart="g lotus && bundle exec rails server thin -p 3010"

# Global Protect VPN
alias global-off='sudo mv /Applications/GlobalProtect.app /Applications/GlobalProtectOFF.app && pkill -9 -f GlobalProtect'
alias global-on='sudo mv /Applications/GlobalProtectOFF.app /Applications/GlobalProtect.app'

