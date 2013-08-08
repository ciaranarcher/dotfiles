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

# Convenience function for use when you encounter Gemfile conflicts when
# rebasing your branch against master in Classic.
#
# Presumes:
# - You have started a rebase and need to resolve conflicts in Gemfile,
#   Gemfile.lock and Gemfile.rails3.lock.
# - You have edited the Gemfile to your satisfaction (usually just changing the
#   zendesk_voice_core sha).
#
# The function will:
# - Add Gemfile.
# - Checks out Gemfile.lock to current HEAD.
# - Checks out Gemfile.rails3.lock to current HEAD.
# - Runs b2a3 (i.e. bundle --local && BUNDLE_GEMFILE=Gemfile.rails3 bundle --local).
# - Add everything again.
# - Runs git rebase --continue.
function rebase_core() {
  echo "rebase_core: You should have a saved Gemfile ready for bundling. Happy to proceed? [Y,n]"
  read input
  if [[ $input == "Y" || $input == "y" ]]; then
    echo "rebase_core: Starting..."
    echo "rebase_core: Adding Gemfile."
    git add Gemfile
    echo "rebase_core: Checking out Gemfile.lock and Gemfile.rails3.lock."
    git checkout HEAD -- Gemfile.lock
    git checkout HEAD -- Gemfile.rails3.lock
    echo "rebase_core: Bundling for Rails 2 and 3."
    b2a3 || { echo 'rebase_core: b2a3 failed. Exiting.'; exit 1; }
    echo "rebase_core: Adding all modified files to git."
    git add .
    echo "rebase_core: Continuing rebase."
    git rebase --continue
    echo "rebase_core: Complete!"
  else
    echo "rebase_core: Outa here."
  fi
}

# Delete all branches that are not your own
# Credit to https://github.com/mphoratiu for help!
function rm_branches() {
  echo -e "rm_branches: The following branches will be deleted locally..."
  local remove="$(git branch | grep -v "ciaran\|master\|ciaranarcher"|sed 's/^..//g')"; echo -e "\x1B[1;31m$remove\x1B[0m"
  read -p "rm_branches: Happy to proceed? [Y,n] " -n 1 input; echo
  if [[ $input == "Y" || $input == "y" ]]; then
    git checkout master
    xargs -n 1 git branch -D <<< $remove &&
    echo -e "rm_branches: Done. Remaining branches:" &&
    git branch
  else
    echo "rm_branches: Outa here."
  fi
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

