## dotfiles

## Install Steps

* Clone this repository into `~/dotfiles`.
* Clone `https://github.com/magicmonty/bash-git-prompt` into  `~/.bash-git-prompt`

Edit your `.bashrc` and add the following lines:
```
source ~/dotfiles/bash/path.sh
source ~/dotfiles/bash/env.sh
source ~/dotfiles/bash/completion.sh
source ~/dotfiles/bash/aliases.sh
source ~/dotfiles/bash/functions.sh
source ~/dotfiles/bash/bash-git-prompt.sh
```

Symlink your `.gitconfig` (backup if required)
```
ln -s dotfiles/gitconfig .gitconfig
```

Reload:
```
source .bashrc
```
