export LANG=en_US.UTF-8
export ZSH="$HOME/.oh-my-zsh"
export UPDATE_ZSH_DAYS=13
export TERM="xterm-256color"

ZSH_THEME=robbyrussell

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export PATH=$HOME/bin:/usr/local/bin:$PATH

plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $HOME/aliases.sh
source $HOME/localaliases.sh

source $ZSH/oh-my-zsh.sh

# Fuzzy finder
# CTRL-T - Paste the selected files and directories onto the command-line
# CTRL-R - Paste the selected command from history onto the command-line
# ALT-C - cd into the selected directory
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

echo "Hello Taras!"
