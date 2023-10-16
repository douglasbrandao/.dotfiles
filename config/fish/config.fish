if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

source (/usr/local/bin/starship init fish --print-full-init | psub)

pyenv init - | source
