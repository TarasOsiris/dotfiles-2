alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip--"'
alias gwipp='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip--"; git push'

alias ealias='nvim ~/.aliases.sh'

# Tools
alias e='nvim'
alias f='ranger'

alias ezsh="nvim ~/.zshrc"
alias czsh='cat ~/.zshrc'
alias szsh='source ~/.zshrc'
alias ev='nvim ~/.vimrc'

# CDs
alias d="cd ~/Documents"
alias dt="cd ~/Desktop"
alias dl="cd ~/Downloads"
alias dw='cd ~/Downloads'
alias tmp='cd /tmp'

# Dropbox
alias db='cd ~/Dropbox'
