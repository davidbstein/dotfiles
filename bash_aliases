export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools

# git shorthand
alias gp='git pull --rebase'
alias gc='git commit -am'
alias gs='git status'
alias gd='git diff'
alias gl='git log'
alias gk='git log --graph --oneline --decorate --boundary --all'
alias gkp='git log --graph --oneline --decorate --boundary --first-parent'
alias gbn='git branch'
alias gbc='git checkout'
alias gbr='git rebase master'
alias gbh='_branch_name=$(git symbolic-ref -q HEAD);_branch_name=${_branch_name##refs/heads/};_branch_name=${_branch_name:-HEAD};git checkout master; git pull --rebase; echo $_branch_name; git checkout $_branch_name; git rebase master;gk|head;'
gkh(){
git log --graph --pretty=format:"%C(yellow)%h%C(white) %ad %ae %x09%d %x09%s" --date=short | head |awk 'BEGIN {FS="\t"};{print substr($1"                           ", 0, 60), $2, $3}'
}

gkph(){
git log --first-parent --graph --pretty=format:"%C(yellow)%h%C(white) %ad %ae %x09%d %x09%s" --date=short | head |awk 'BEGIN {FS="\t"};{print substr($1"                           ", 0, 60), $2, $3}'
}

alias gpush='git push'

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

giffify(){
  ffmpeg -i $1 -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > $2
}

ln -s "/Applications/Sublime Text 2.app/Contents/SharedSupport/bin/subl" ~/bin/subl
alias grl='gr | less'
PATH="$PATH:~/bin"
source ~/.extra_aliases
