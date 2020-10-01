# dotfiles
My dotfiles


## Initial clone and checkout
```
git clone --bare https://github.com/ukaiser/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout
config config --local status.showUntrackedFiles no
```





