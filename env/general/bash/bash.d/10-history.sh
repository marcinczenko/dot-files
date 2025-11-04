# I want to keep the whole history
HISTCONTROL=ignoredups:ignorespace
HISTSIZE=-1
HISTFILESIZE=-1
# This is the trick to preserve multilines
# See: https://askubuntu.com/questions/1133015/multiline-command-chunks-in-bash-history-into-multiple-lines
HISTTIMEFORMAT="%F %T "

# 1) Group multi-line commands into a single history entry
# 2) And store them with embedded newlines (not squashed into ';')
shopt -s cmdhist
shopt -s lithist
# Preserve history across concurrent shells
shopt -s histappend

# Remove any 'history ...' parts from existing PROMPT_COMMAND safely
if [[ -n "$PROMPT_COMMAND" ]]; then
  IFS=';' read -ra parts <<< "$PROMPT_COMMAND"
  new_parts=()
  for part in "${parts[@]}"; do
    # Trim leading/trailing spaces
    trimmed="$(echo "$part" | xargs)"
    # Keep only parts that don't start with "history"
    if [[ -n "$trimmed" && "$trimmed" != history* ]]; then
      new_parts+=("$trimmed")
    fi
  done
  PROMPT_COMMAND="$(IFS='; '; echo "${new_parts[*]}")"
fi

# Prepend our clean sync logic
# Previously I had "history -a; history -n" but it felt too dynamic
# Now I am keeping the history private and only wirting it to the
# bash-history after closing the terminal or explicitely doing "history -w" manually
PROMPT_COMMAND="history -n${PROMPT_COMMAND:+; $PROMPT_COMMAND}"

# Some old comments for reference
# persist the history immediately
# see: https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
#      https://blog.sanctum.geek.nz/better-bash-history/
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

