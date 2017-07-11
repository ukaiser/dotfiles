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
echo ".cfg" >> .gitignore
```

## Install Vundle plugin manager for vim
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```





