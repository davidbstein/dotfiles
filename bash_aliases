ccat() {
       pygmentize -g $1 | nl -ba
       }

alias less='less -r'
source ~/.extra_aliases
