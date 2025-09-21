# I want to keep the whole history
HISTCONTROL=ignorespace
HISTSIZE=-1
HISTFILESIZE=-1

# persist the history immediately
# see: https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps
#      https://blog.sanctum.geek.nz/better-bash-history/
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
