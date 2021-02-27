# Guide to setting up a new computer

## the old way (2018)

[link](README_orig.md)

A weird mishmash of mac and ubuntu stuff. 10 years of collected configs, updated haphazardly.

## Mac Mini (2021) initial setup:

* installed chrome and firefox.
* sign in to 1password browser extensions.
* set up bluetooth devices.
* Install bootstapping apps:
  * iterm2.
  * Dropbox.
  * 1password.
  * homebrew.

First round of config:
 * `brew install mackup`
 *  set 1password auto-lock on firefox, chrome, macOS
 * Dropbox: set important folders to local. __IMPORTANT: everything breacks if "Mackup" folder is online-only.
 
Important Utilities:
 * PDFExpert
 * Microsoft Office
 * Sublime
 * Setapp: (Ulysses, 
 * duet
 * divvy 
    * download from website, not app store. Seach gmail for "License for Mizage Order" to find licence.
    * to migrate - go to an old computer and visit divvy://export - then visit the resulting URL on the new machine.
    * start at login, cycle between screens, global shortcut ^(opt)N.
 * brew install fish
 * brew install emacs
 
 REBOOT
 
  * karabiner-elements
  * `yes Yes | mackup restore`
  * fix fish (omf and mackups may conflict)
  
  
Settings:
  * preferences -> keyboard -> modifier keys -> capslock to control
  * preferences -> desktop -> (hot corner to mission control, screen saver off)
  
  * firefox -> about:config -> (pdfjs.defaultZoomValue=100%; pdfjs.scrollModeOnLoad=2;pdfjs.spreadModeOnLoad=0)
  
TODO:
 * default shell
 * 
  
