# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
#
# Use VSCode instead of neovim as your default editor
# export EDITOR="code"
#
# Set a custom prompt with the directory revealed (alternatively use https://starship.rs)
# PS1="\W \[\e]0;\w\a\]$PS1"

_dotdir="$HOME/.local/share/marcinczenko/dot-files/env/general/bash/bash.d/"

if [ -d "$_dotdir" ]; then
  find $_dotdir -maxdepth 1 -mindepth 1 -type f -print0 |
    sort -z |
    while IFS= read -r -d '' file; do
      echo "Sourcing: $file"
      #[ -r "$file" ] && . "$file"
    done
fi
unset _dotdir
