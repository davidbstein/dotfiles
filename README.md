
> everything is in [Mackup](https://github.com/lra/mackup) now

dotfiles
========

everything in this is hacky or broken. Over 15 years of wedging stuff in and not removing it unless it's actively broken.


instructions
========

Don't use this. It's just for me.

 - check out repo in home directory
 - run `setup.sh`
 - forget this thing exists

 - when you get a new computer run `git add . ; git commit -m 'incremental'` on every box and deal with the horrible merge conflicts
 - forget this thing exists again.


Crap to install
===============

 - [setresX](https://www.sendspace.com/file/mef6sk)
 - [chrome](http://google.com)
 - [karabineR](https://pqrs.org/osx/karabiner/)
   - [arrow keys to home/end/pgup/pgdwn](https://www.dropbox.com/home/documents/Karabiner?preview=private.xml)
   - VI MODE -> COmmand_L+hjkl to L/D/U/R
   - Key Repeat -> 250ms delay, 27ms repeat rate
 - keyboard settings
   - use standard function keys
   - caps lock -> control(^)
 - [dropbox](http://dropbox.com)
   - `cd; ln -s "Dropbox/repo_folder" .; ln -s "Dropbox/repos" .;cd -`
   - remap `~/Downloads` to `~/Dropbox/Downloads`. simlink is fine.
 - get your ssh keys from the secret place where they are and put them in .ssh
   - ssh-add them
   - put them in the OSX keyring
   - the passphrase is the one you set up while at dropbox for your rsa keys.
 - [iterm2](https://www.iterm2.com/downloads.html)
   - infinite scrollback
   - hotkey window and profile
   - install this repo
 - [divvy](https://itunes.apple.com/us/app/divvy-window-manager/id413857545?mt=12)
   - woo
 - [brew](brew.sh)
 - [1password](https://agilebits.com/downloads)
 - [sublime text](https://www.sublimetext.com/)
   - run "install package control"
   - add the [`subl`](https://www.sublimetext.com/docs/2/osx_command_line.html) command
   - TODO: get a list of packages I use.
 - python
   - pipenv
   - jupyter
 - fish
   - OMF
     - autojump, fish-spec omf
     - lambda theme
   - fisher
     - fzf
     - get
     - getopts
   
# Slack theme

```
#f0f0f0,#eeeeee,#cccccc,#555555,#dddddd,#555555,#55bb55,#dddddd
```
