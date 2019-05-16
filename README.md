# dotfiles
My dotfiles


## add alias to current shell
```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

and

```
git clone --bare https://github.com/ukaiser/dotfiles.git $HOME/.cfg
config checkout
config config --local status.showUntrackedFiles no
```

## Run setup

~/bin/setup






