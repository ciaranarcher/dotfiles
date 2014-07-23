# List all functions in this file
function funs() {
  local current_file=$(cd `dirname "${BASH_SOURCE[0]}"` && pwd)/`basename "${BASH_SOURCE[0]}"`
  echo -e "funs: The following functions are available in $current_file...\n"
  grep "^function " $current_file | cut -d ' ' -f 2
  echo -e "\nOuta here."
}

# Create directory and cd to it.
#
#     henrik@Nyx /tmp$ mkcd foo/bar/baz
#     henrik@Nyx /tmp/foo/bar/baz$
function mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Git - find out where a particular commit is
function fsha() {
  echo "Fetching..."
  git fetch

  if [[ "$@" != "" ]]; then
    for hash in $@;do
        echo "Searching branches for '$hash'...";
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
function rm_others_branches() {
  git checkout master

  echo -e "rm_others_branches: The following branches will be deleted locally..."
  local remove="$(git branch | grep -v "ciaran\|master\|ciaranarcher"|sed 's/^..//g')"; echo -e "\x1B[1;31m$remove\x1B[0m"
  read -p "rm_others_branches: Happy to proceed? [Y,n] " -n 1 input; echo
  if [[ $input == "Y" || $input == "y" ]]; then
    git checkout master
    xargs -n 1 git branch -D <<< $remove &&
    echo -e "rm_others_branches: Done. Remaining branches:" &&
    git branch
  else
    echo "rm_others_branches: Outa here."
  fi
}

# Reads all merged local branches and offers to delete any
function rm_my_branches() {
  git checkout master

  echo -e "rm_my_branches: The following merged branches have been found...\n"
  local to_remove="$(git branch --merged | grep "ciaran")"
  echo -e "\x1B[1;31m$to_remove\x1B[0m \n"

  for branch in ${to_remove[@]}; do
    echo -e "rm_my_branches: \x1B[1;31m$branch\x1B[0m"
    read -p "Remove? [Y,n] " -n 1 input; echo

    if [[ $input == "Y" || $input == "y" ]]; then

      git branch -D $branch
      echo -e "rm_my_branches: Removed $branch.\n"
    else
      echo -e "rm_my_branches: Skipped $branch.\n"
    fi
  done

  echo -e "rm_my_branches: Remaining branches:"
  git branch
  echo -e "rm_my_branches: Outa here."
}

# Convienence function
function rm_branches() {
  rm_others_branches
  rm_my_branches
}

# https://gist.github.com/jimbojsb/1630790
# light <syntax> <filename>
# Enter the syntax on the command line and either copy from the clipboard (light js)
# or pass a filename too (light js func.js). Then just paste into Keynote or whatever.
function light() {
  if [ -z "$2" ]
    then src="pbpaste"
  else
    src="cat $2"
  fi
  $src | highlight -O rtf --syntax $1 --font Inconsolata --style solarized-dark --font-size 12 | pbcopy
}

# Prints the 10 most recently authored git branches.
function rb() {
   git for-each-ref --sort='-authordate' --format='%(refname)' refs/heads | sed -e 's-refs/heads/--' | head -n 10
}
