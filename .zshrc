export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=13
export TERM="xterm-256color"
export FZF_DEFAULT_OPTS="--history=$HOME/.fzf_history"
export PATH=/usr/local/bin:$PATH
export PATH="/opt/homebrew/bin:$PATH"

ZSH_THEME=robbyrussell

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(git zsh-syntax-highlighting zsh-autosuggestions you-should-use)

source $HOME/aliases.sh
source $HOME/localaliases.sh

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/taras/google-cloud-sdk/path.zsh.inc' ]; then . '/home/taras/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/taras/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/taras/google-cloud-sdk/completion.zsh.inc'; fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
