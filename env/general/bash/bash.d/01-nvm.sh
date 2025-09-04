# OMARCHY sets `set +h` in `~/.local/share/omarchy/default/bash/shell` - this
# causes NVM to coplain with: bash: hash: hashing disabled.
# Thus, we reset it here.
# See also: https://askubuntu.com/questions/1517674/bash-hash-hashing-disabled
set -h

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
