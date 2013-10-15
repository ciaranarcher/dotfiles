## dotfiles

## Install Steps

Clone the repo
Edit your `.bashrc` and add the following lines:

```
source ~/dotfiles/bash/path.sh
source ~/dotfiles/bash/env.sh
source ~/dotfiles/bash/completion.sh
source ~/dotfiles/bash/aliases.sh
source ~/dotfiles/bash/functions.sh
source ~/dotfiles/bash/prompt.sh
```

Symlink your `.gitconfig` (backup if required)

```
ln -s dotfiles/gitconfig .gitconfig
```

Reload:

```
source .bashrc
```
