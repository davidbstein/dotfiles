# Mac Config Tricks

## Finder

### Hotkeys:

 - **hidden files** `cmd + shift + .`


## Firefox

### pdf settings

tweaks in `about:config`

for more info see @mozilla
[mozilla/pdf.js/web/ui_utils.js](https://github.com/mozilla/pdf.js/blob/master/web/ui_utils.js) and 
[mozilla/pdf.js/web/app_options.js](https://github.com/mozilla/pdf.js/blob/master/web/app_options.js)
```
  pdfjs.defaultZoomValue = 80%;
  pdfjs.enabledCache.state = true;
  pdfjs.migrationVersion = 2; // no idea why I set this, probably safe to ignore
  pdfjs.scrollModeOnLoad = 2; 
```
