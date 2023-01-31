#!/bin/bash

echo "Downloading neovim..."
wget -O ./neovim.deb https://github.com/neovim/neovim/releases/download/v0.8.2/nvim-linux64.deb

echo "Installing neovim"
sudo apt install ./neovim.deb

echo "Creating symlinks"
ln -sfn $HOME/.dotfiles/git/.gitconfig ~/.
ln -sfn $HOME/.dotfiles/zsh/.zshrc ~/.
ln -sfn $HOME/.dotfiles/vim/.vimrc ~/.
ln -sfn $HOME/.dotfiles/nvim/ ~/.config
