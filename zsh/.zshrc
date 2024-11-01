export ZSH="$HOME/.oh-my-zsh"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

#ZSH_THEME="robbyrussell"

plugins=(
    git
    virtualenv
    copyfile # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/copyfile
    docker
    extract # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/extract
    gitignore # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitignore
)

source $ZSH/oh-my-zsh.sh

### Added by Zinit's installer

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

### End of Zinit's installer chunk

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions

# Enable starship
eval "$(starship init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/douglas/stone/update-leads-inbound-rand/google-cloud-sdk/path.zsh.inc' ]; then . '/home/douglas/stone/update-leads-inbound-rand/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/douglas/stone/update-leads-inbound-rand/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/douglas/stone/update-leads-inbound-rand/google-cloud-sdk/completion.zsh.inc'; fi

alias queries="cd /home/douglas/stone/automated-relationship-dialogflow-bigquery-analytics"
alias bot="cd /home/douglas/stone/automated-relationship-dialogflow-agents-manager"
alias webhooks="cd /home/douglas/stone/automated-relationship-agents-webhooks"
