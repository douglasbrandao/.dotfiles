#!/bin/bash

echo "Updating and upgrading local package index..."
sudo apt update && sudo upgrade -y

#echo "Downloading git..."
#sudo apt install git

echo "Installing fish and setting it as default shell..."
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish
sudo chsh -s $(which fish)

echo "Installing starship..."
echo starship init fish | source >> ~/.config/fish/config.fish

echo "Downloading neovim..."
wget -O ./neovim.deb https://github.com/neovim/neovim/releases/download/v0.8.2/nvim-linux64.deb

echo "Installing neovim"
sudo apt install ./neovim.deb

echo "Creating symlinks"
ln -sfn $HOME/.dotfiles/git/.gitconfig ~/.
ln -sfn $HOME/.dotfiles/zsh/.zshrc ~/.
ln -sfn $HOME/.dotfiles/vim/.vimrc ~/.
ln -sfn $HOME/.dotfiles/config ~/.config
