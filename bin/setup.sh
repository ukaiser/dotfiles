#!/bin/bash

mkdir -p Downloads
mkdir -p Developer

# programm to compile to clipboard
sudo apt-get install xsel


TPM_DIR=~/.tmux/plugins/tpm
VUNDLE_DIR=~/.vim/bundle/Vundle.vim
GO_POWERLINE=${HOME}/bin/powerline-go

if [ ! -d "$TPM_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ ! -d "$VUNDLE_DIR" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi


if [[ ! -f "$GO_POWERLINE" ]]; then
 wget  -O $GO_POWERLINE https://github.com/justjanne/powerline-go/releases/download/v1.12.1/powerline-go-linux-amd64
  chmod +x $GO_POWERLINE
fi

if ! grep -q "bashrc_addon" "${HOME}/.bashrc"; then

cat << EOF >> "${HOME}/.bashrc"
source $HOME/bin/.bashrc_addon
EOF

fi
