mv ~/dotfiles ~/.dotfiles

sudo apt-get install byobu

for dotfile in $(ls ~/.dotfiles)
do 
    rm -rf ~/.$dotfile
    ln -s ~/.dotfiles/$dotfile ~/.$dotfile
done 
exec bash
