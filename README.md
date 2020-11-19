
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



Random HOWTOS
=========

How to use Nikon D3300 as a webcam
-----------
(works with any camera that gphoto2 understands)

Blog posts and stackoverflow all recommend `gst-launch` or `v4l2sink`, both of which have compatability issues with chrome and firefox and so are not workable options. Use `ffmpeg` instead. because always use `ffmpeg` instead:

```fish
    gphoto2 --stdout --capture-movie | ffmpeg -i - -vcodec rawvideo -pix_fmt yuv420p -threads 0 -f v4l2 /dev/video0 ; kill (ps aux | grep gphoto | awk '{print $2}')
```

There might be a reason to create multiple video loopbacks (e.g. using OBS to manipulate a camera feed). you need to remove v4l from teh kernel and reload it with proper settings: 

```
# remove
sudo modprobe -r v4l2loopback 
# add
sudo modprobe v4l2loopback devices=3 video_nr=0 card_label="USB Cam" exclusive_caps=1  video_nr=10 card_label="OBS Cam" exclusive_caps=1 
# /creates /dev/video{0,10,1}. "exclusive caps" is needed for Chrome interop. no idea why.
```
