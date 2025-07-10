# mac studio (2025) setup process

* installed firefox.
* Install bootstapping apps:
  * iterm2.
  * Dropbox.
  * 1password.
  * homebrew.
  * uv

First round of config:
 * `brew install mackup`
 * set 1password auto-lock on firefox, chrome, macOS
 * Dropbox: set important folders to local. __IMPORTANT: everything breacks if "Mackup" folder is online-only.
 
Important Utilities:
 * Sublime (`sudo ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/`)
 * karabiner-elements
 * brew install fish
   * install [ohmyfish](https://github.com/oh-my-fish/oh-my-fish)
   * `omf install lambda`
   * `echo $(which fish) >> /etc/shells`
   * `cshs -s $(which fish)`
 * divvy 
    * download from website, not app store. Seach gmail for "License for Mizage Order" to find licence.
    * to migrate - go to an old computer and visit divvy://export - then visit the resulting URL on the new machine. Or visit the link in the email thread.
    * start at login, cycle between screens, global shortcut ^(opt)N.
 * `yes Yes | mackup restore`
    * if `~/.mackup.cfg` doesn't have an `[applications to ignore]` entry from iterm, break simlink to mackup in iTerm settings `rm Library/Preferences/com.googlecode.iterm2.plist`,
    * restore iTerm settings from Dropbox/Mackup/iterm...
  
Settings:
  * preferences -> keyboard -> modifier keys -> capslock to control
  * preferences -> desktop -> (hot corner to mission control, screen saver off)

  * firefox -> about:config -> (pdfjs.defaultZoomValue=100%; pdfjs.scrollModeOnLoad=2;pdfjs.spreadModeOnLoad=0)

REBOOT

TODO:

More Installs:
 * aText (seach "Your aText Delivery" for license code)
 * `brew install easy-move-plus-resize` (alt+cmd, middle click resize)
 * pdfCropMargins
