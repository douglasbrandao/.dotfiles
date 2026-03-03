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
[[ ! -d "$DOTFILES" ]] && error "Pasta $DOTFILES não encontrada. Clone o repositório primeiro."

OS_TYPE=""

if [[ "$(uname)" == "Darwin" ]]; then
  OS_TYPE="macos"
elif [[ "$(uname)" == "Linux" ]]; then
  if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    if [[ "$ID" == "ubuntu" ]]; then
      OS_TYPE="ubuntu"
    fi
  fi
fi

[[ -z "$OS_TYPE" ]] && error "Sistema não suportado. Use macOS ou Ubuntu."

info "Sistema detectado: $OS_TYPE"

install_brew() {
  info "Verificando Homebrew..."
  if ! command -v brew &>/dev/null; then
    info "Instalando Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if [[ -x /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -x /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi

    success "Homebrew instalado."
  else
    success "Homebrew já instalado."
  fi

  brew update --quiet
}

install_cli_macos() {
  info "Instalando pacotes CLI (macOS)..."
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
}

install_fonts_apps_macos() {
  info "Instalando fontes e apps (macOS)..."
  brew install --cask \
    font-fira-code-nerd-font \
    font-noto-sans-symbols-2 \
    ghostty

  success "Fontes e apps instalados."
}

install_cli_ubuntu() {
  info "Atualizando índices APT..."
  sudo apt update -y

  info "Instalando pacotes CLI (Ubuntu)..."
  sudo apt install -y \
    bash \
    bc \
    coreutils \
    gawk \
    jq \
    git \
    neovim \
    tmux \
    fzf \
    ripgrep \
    fd-find \
    zsh \
    curl

  if ! command -v gh &>/dev/null; then
    warn "GitHub CLI (gh) não encontrado. Instale manualmente se precisar: https://cli.github.com/"
  fi

  if ! command -v glab &>/dev/null; then
    warn "GitLab CLI (glab) não encontrado. Instale manualmente se precisar: https://gitlab.com/gitlab-org/cli"
  fi

  if ! command -v starship &>/dev/null; then
    info "Instalando Starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
  fi

  mkdir -p "$HOME/.local/bin"
  if command -v fdfind &>/dev/null && [[ ! -e "$HOME/.local/bin/fd" ]]; then
    ln -s "$(command -v fdfind)" "$HOME/.local/bin/fd"
    success "Alias de fd criado em ~/.local/bin/fd"
  fi

  success "Pacotes CLI instalados."
}

install_fonts_apps_ubuntu() {
  info "Instalando fontes (Ubuntu)..."
  sudo apt install -y \
    fonts-firacode \
    fonts-noto-color-emoji || warn "Falha ao instalar uma ou mais fontes via APT."

  warn "Ghostty não é instalado automaticamente no Ubuntu por este script."
}

# ============================================================
# Packages by OS
# ============================================================
if [[ "$OS_TYPE" == "macos" ]]; then
  install_brew
  install_cli_macos
  install_fonts_apps_macos
else
  install_cli_ubuntu
  install_fonts_apps_ubuntu
fi

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
if command -v nvim &>/dev/null; then
  nvim --headless "+Lazy! sync" +qa 2>/dev/null && success "Plugins do Neovim instalados." || warn "Instale os plugins manualmente abrindo o Neovim."
else
  warn "Neovim não encontrado; pulando instalação de plugins."
fi

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
