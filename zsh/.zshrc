for FILE in $HOME/.dotfiles/zsh/zshrc/*; do
  if [[ -f "$FILE" && -r "$FILE" ]]; then
    source $FILE
  fi
done
