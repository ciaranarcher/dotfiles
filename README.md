## dotfiles

## Install Steps

* Clone this repository into `~/dotfiles`.
* Install https://github.com/robbyrussell/oh-my-zsh

Symlink:
```
ln -s dotfiles/zshrc .zshrc
ln -s dotfiles/zshenv .zshenv
ln -s dotfiles/gitconfig .gitconfig
ln -s dotfiles/gitignore .gitignore
ln -s dotfiles/agignore .agignore
ln -s dotfiles/vim .vim
ln -s dotfiles/vimrc .vimrc
ln -s dotfiles/ideavimrc .ideavimrc
```

You'll need to install [Vundle](https://github.com/VundleVim/Vundle.vim) for the vim plugins to work.

Reload:
```
source .bashrc
```
