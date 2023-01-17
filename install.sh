#!/bin/bash

echo "Downloading neovim..."
wget -O ./neovim.deb https://github.com/neovim/neovim/releases/download/v0.8.2/nvim-linux64.deb

echo "Installing neovim"
sudo apt install ./neovim.deb

echo "Creating symlinks"
ln -sfn /home/$USER/.dotfiles/git/.gitconfig ~/.
ln -sfn /home/$USER/.dotfiles/zsh/.zshrc ~/.
ln -sfn /home/$USER/.dotfiles/vim/.vimrc ~/.
ln -sfn /home/$USER/.dotfiles/nvim/ ~/.config
