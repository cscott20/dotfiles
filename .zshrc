# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
PROMPT='%F{green}%n%F%F{white}:%F%F{blue}%~%F%F{white} $ '
#RPROMPT='%F{green}%*%F'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$HOME/.poetry/bin:$PATH"



# In order for gpg to find gpg-agent, gpg-agent must be running, and there must be an env
# variable pointing GPG to the gpg-agent socket. This little script, which must be sourced
# in your shell's init script (ie, .bash_profile, .zshrc, whatever), will either start
# gpg-agent or set up the GPG_AGENT_INFO variable if it's already running.

# Add the following to your shell init to set up gpg-agent automatically for every shell
# if [ -f ~/.gnupg/.gpg-agent.conf ] && [ -n "$(pgrep gpg-agent)" ]; then
#     source ~/.gnupg/gpg-agent.conf
#     export GPG_AGENT_INFO
# else
#     #eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
#     eval $(gpg-agent --daemon ~/.gnupg/gpg-agent.conf)
# fi


alias brewr="arch -x86_64 /usr/local/bin/brew $@"
#brew ## == M1
#brewr ## == rosetta


export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export PATH="/usr/local/bin:$PATH"


alias ibrew="arch -x86_64 /usr/local/bin/brew $@"


function cd() {
  builtin cd "$@"
  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./venv ]] ; then
        source ./venv/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}




export PATH="/usr/local/opt/python@3.7/bin:$PATH"
# Created by `pipx` on 2021-10-20 21:00:10
export PATH="$PATH:/Users/charlie/.local/bin"
eval "$(aactivator init)"


# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
RPROMPT='%F{green}${vcs_info_msg_0_}%F'



#
eval "$(fnm env --use-on-cd)"
export PATH="/usr/local/opt/node@14/bin:$PATH"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
