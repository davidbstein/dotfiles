
# git shorthand
alias gp='git pull --rebase'
alias gc='git commit -am'
alias gs='git status'
alias gd='git diff'
alias gl='git log'

# shorthand
alias lp='ls --color=always | grep -P "^((?!\.).)*$|\.py$|\.coffee$|\.sh$" --color=never | column'
alias emacs='/usr/bin/emacs'
alias less='less -r'

gr() {
    sudo grep -r $2 $1 . --color=always
}
ccat() {
       pygmentize -g $1 | nl -ba
}

alias grl='gr | less'
source ~/.extra_aliases
