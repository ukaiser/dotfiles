# dotfiles
My dotfiles

## Install oh-my-zsh
### ubuntu
```
sudo apt-get install zsh
sudo apt-get install git
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

## dot file repo
add to .bashrc or .zsh

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

and 

```
git clone --bare https://github.com/ukaiser/dotfiles.git $HOME/.cfg
config checkout
config config --local status.showUntrackedFiles no
```

## Install Vundle plugin manager for vim
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
To install plugins start vim and type
```
:PluginInstall
```






