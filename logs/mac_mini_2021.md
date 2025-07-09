# mac mini (2021) setup process
_also followed (mostly) for macbook)_

* installed chrome and firefox.
* sign in to 1password browser extensions.
* set up bluetooth devices.
* Install bootstapping apps:
  * iterm2.
  * Dropbox.
  * 1password.
  * homebrew.
  * uv

First round of config:
 * `brew install mackup`
 *  set 1password auto-lock on firefox, chrome, macOS
 * Dropbox: set important folders to local. __IMPORTANT: everything breacks if "Mackup" folder is online-only.
 
Important Utilities:
 * PDFExpert
 * Microsoft Office
 * Sublime (`sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/`)
 * duet
 * divvy 
    * download from website, not app store. Seach gmail for "License for Mizage Order" to find licence.
    * to migrate - go to an old computer and visit divvy://export - then visit the resulting URL on the new machine.
    * start at login, cycle between screens, global shortcut ^(opt)N.
 * brew install fish
   * install [ohmyfish](https://github.com/oh-my-fish/oh-my-fish)
   * `omf install lambda`
   * `echo $(which fish) >> /etc/shells`
   * `cshs -s $(which fish)`
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

More Installs:
 * Timeular
 * aText (seach "Your aText Delivery" for license code)
 * `brew install easy-move-plus-resize` (alt+cmd, middle click resize)
 * fliqlo screensaver
 * Setapp
   * Ulysses
   * Forklift
   * Paw

 * pdfCropMargins
```
brew install ghostscript
brew install poppler
brew install llvm
pip3 install pdfCropMargins[gui] --user --upgrade
```
