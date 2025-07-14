for FILE in zshrc/*; do
  if [[ -f "$FILE" && -r "$FILE" ]]; then
    source $FILE
  fi
done
