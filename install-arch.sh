#!/bin/bash

echo "Updating and upgrading local package index..."
pacman -Syu

echo "Downloading git..."
pacman -S git

echo "Installing fish and setting it as default shell..."
pacman -S fish 
sudo chsh -s /usr/bin/fish

echo "Installing starship..."
pacman -S starship
echo starship init fish | source >> ~/.config/fish/config.fish

echo "Installing neovim..."
sudo pacman -S neovim

echo "Creating symlinks"
ln -sfn $HOME/.dotfiles/git/.gitconfig ~/.
ln -sfn $HOME/.dotfiles/nvim/ ~/.config
ln -sfn $HOME/.dotfiles/starship.toml ~/.config
