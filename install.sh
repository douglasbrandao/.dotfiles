#!/bin/bash

set -e

DOTFILES="$HOME/.dotfiles"

# ============================================================
# Colors
# ============================================================
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

info()    { echo -e "${BLUE}[INFO]${NC} $1"; }
success() { echo -e "${GREEN}[OK]${NC} $1"; }
warn()    { echo -e "${YELLOW}[WARN]${NC} $1"; }
error()   { echo -e "${RED}[ERROR]${NC} $1"; exit 1; }

# ============================================================
# Checks
# ============================================================
[[ "$(uname)" != "Darwin" ]] && error "Este script é apenas para macOS."
[[ ! -d "$DOTFILES" ]] && error "Pasta $DOTFILES não encontrada. Clone o repositório primeiro."

# ============================================================
# Homebrew
# ============================================================
info "Verificando Homebrew..."
if ! command -v brew &>/dev/null; then
  info "Instalando Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  success "Homebrew instalado."
else
  success "Homebrew já instalado."
fi

brew update --quiet

# ============================================================
# CLI packages
# ============================================================
info "Instalando pacotes CLI..."
brew install \
  bash \
  bc \
  coreutils \
  gawk \
  gh \
  glab \
  gnu-sed \
  jq \
  git \
  neovim \
  tmux \
  fzf \
  ripgrep \
  fd \
  starship \
  zsh

success "Pacotes CLI instalados."

# ============================================================
# Fonts & Apps
# ============================================================
info "Instalando fontes e apps..."
brew install --cask \
  font-fira-code-nerd-font \
  font-noto-sans-symbols-2 \
  ghostty

success "Fontes e apps instalados."

# ============================================================
# NVM
# ============================================================
info "Verificando NVM..."
if [[ ! -d "$HOME/.nvm" ]]; then
  info "Instalando NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
  success "NVM instalado."
else
  success "NVM já instalado."
fi

# ============================================================
# TPM (Tmux Plugin Manager)
# ============================================================
info "Verificando TPM..."
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
  info "Instalando TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  success "TPM instalado."
else
  success "TPM já instalado."
fi

# ============================================================
# Zinit (Zsh Plugin Manager)
# ============================================================
info "Verificando Zinit..."
if [[ ! -f "$HOME/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
  info "Instalando Zinit..."
  mkdir -p "$HOME/.local/share/zinit"
  git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git"
  success "Zinit instalado."
else
  success "Zinit já instalado."
fi

# ============================================================
# Symlinks
# ============================================================
info "Criando symlinks..."

create_symlink() {
  local src="$1"
  local dst="$2"

  # Cria diretório pai se necessário
  mkdir -p "$(dirname "$dst")"

  if [[ -L "$dst" ]]; then
    warn "Symlink já existe: $dst — substituindo."
    ln -sf "$src" "$dst"
  elif [[ -e "$dst" ]]; then
    warn "Arquivo existente em $dst — fazendo backup para $dst.bak"
    mv "$dst" "$dst.bak"
    ln -s "$src" "$dst"
  else
    ln -s "$src" "$dst"
  fi

  success "$dst → $src"
}

create_symlink "$DOTFILES/.tmux.conf"              "$HOME/.tmux.conf"
create_symlink "$DOTFILES/zsh/.zshrc"              "$HOME/.zshrc"
create_symlink "$DOTFILES/git/.gitconfig"          "$HOME/.gitconfig"
create_symlink "$DOTFILES/vim/.vimrc"              "$HOME/.vimrc"
create_symlink "$DOTFILES/config/nvim"             "$HOME/.config/nvim"
create_symlink "$DOTFILES/config/starship.toml"    "$HOME/.config/starship.toml"
create_symlink "$DOTFILES/config/ghostty"          "$HOME/.config/ghostty"

# ============================================================
# Neovim plugins
# ============================================================
info "Instalando plugins do Neovim (lazy.nvim)..."
nvim --headless "+Lazy! sync" +qa 2>/dev/null && success "Plugins do Neovim instalados." || warn "Instale os plugins manualmente abrindo o Neovim."

# ============================================================
# Tmux plugins
# ============================================================
info "Instalando plugins do Tmux..."
if command -v tmux &>/dev/null && [[ -f "$HOME/.tmux/plugins/tpm/bin/install_plugins" ]]; then
  "$HOME/.tmux/plugins/tpm/bin/install_plugins" && success "Plugins do Tmux instalados." || warn "Instale os plugins manualmente com Ctrl+A + I dentro do tmux."
fi

# ============================================================
# Done
# ============================================================
echo ""
echo -e "${GREEN}============================================${NC}"
echo -e "${GREEN}  Setup completo!${NC}"
echo -e "${GREEN}============================================${NC}"
echo ""
echo "Próximos passos:"
echo "  1. Reinicie o terminal"
echo "  2. Abra o tmux e pressione Ctrl+A + I para garantir que os plugins estão instalados"
echo "  3. Abra o Neovim para finalizar a instalação dos plugins"
echo ""
