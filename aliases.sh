alias df='cd ~/dotfiles'

# GIT
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip--"'
alias gwipp='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip--"; git push'

alias ealias='nvim ~/aliases.sh'

# Tools
alias e='nvim' # edit
alias es='nvim -S' # edit and restore session
alias ea='nvim -p *' # edit all files in tabs

alias f='ranger'
alias b='bat'
alias u='yay -Syu --noconfirm'

alias ezsh="nvim ~/.zshrc"
alias czsh='cat ~/.zshrc'
alias szsh='source ~/.zshrc'
alias ev='nvim ~/.config/nvim/init.vim'

# CDs
alias d="cd ~/Documents"
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias dw='cd ~/Downloads'
alias tmp='cd /tmp'

# Dropbox
alias db='cd ~/Dropbox'
