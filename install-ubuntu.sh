#!/bin/bash

echo "Updating and upgrading local package index..."
sudo apt update && sudo upgrade -y

echo "Downloading git..."
sudo apt install git

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

echo "Installing vscode..."
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https
sudo apt update
sudo apt install code

echo "Installing notion..."
sudo snap install notion-snap

echo "Installing obsidian..."
wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.1.9/obsidian_1.1.9_amd64.snap
sudo snap install obsidian_1.1.9_amd64.snap --dangerous --classic

echo "Installing insomnia..."
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list
sudo apt-get update
sudo apt-get install insomnia

echo "Installing vlc..."
sudo snap install vlc

echo "Creating symlinks"
ln -sfn $HOME/.dotfiles/git/.gitconfig ~/.
ln -sfn $HOME/.dotfiles/zsh/.zshrc ~/.
ln -sfn $HOME/.dotfiles/vim/.vimrc ~/.
ln -sfn $HOME/.dotfiles/nvim/ ~/.config
ln -sfn $HOME/.dotfiles/starship.toml ~/.config
