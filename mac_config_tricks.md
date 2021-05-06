# Mac Config Tricks

## Sublime

<details><summary>basic sublime usage</summary>

 - there is a python console at `` ctrl+` ``
 - API reference is [here](https://www.sublimetext.com/docs/3/api_reference.html)
 - Don't use raw commands, use `view.run_command`
   - there's a decent list of available commands [here](https://sublime-text-unofficial-documentation.readthedocs.io/en/sublime-text-3/reference/commands.html)
  
```
// get current open tab
view = sublime.active_window().active_view()
// wrap "insert at cursor" function
insert_fn = lambda s: view.run_command("insert", {"characters": s})
// insert some text
[insert_fn(f"test: {x}\n") for x in range(4)]
```


</details>

## Karabiner

Karabiner-Elements is how my keyboard works at all without kiling my fingers.
Karabiner-EventViewer is like `xev` for mac, but better.

<details><summary>Karabiner</summary>

- [Genesy's complex rule generator](https://genesy.github.io/karabiner-complex-rules-generator/) is a good how-to for making rules.
- Rules go to `~/.config/karabiner/assets/complex_modifications/<whatever>.json`
- Karabiner finds them pretty easily.

</details>

## Finder
<details><summary>Finder</summary>

### Hotkeys:

 - **hidden files** `⌘⇪.`
 - holding ⌥ while looking at the menus will show extra options and locations.
 - **GOTO** `⌘⇪g`

</details>

## Firefox Config stuff

<details><summary>firefox</summary>

### adding customization

- The entire browser view is html/css. 
- You can attach a remote debugger to it using [these instructions](https://developer.mozilla.org/en-US/docs/Tools/Browser_Toolbox)

**key files for adding css and javacsript**

Find your profile folder:
 - found by clicking "Profile Folder" in `about:support` (unlinkable - type `about:support` into the address bar)
 - Likely in `~/Library/Application\ Support/Firefox/Profiles/*/chrome/userContent.css` (you may need to create it)

**CSS**
  - find `$PROFILE_FOLDER/chrome/userContent.css` - it will reload every time you restart Firefox and runs at the **browser** level

**javascript**
  - my solution here sucks, requires reloading every browser refresh. There's a WONTFIX on this, which is frustrating.
  - create an addon. An addon is:
    - a `manifest.json`
    - a javascript file, which will execute any time the current `location` matches the regex in the manifest
      - **I haven't read the spec.** here are the roadbumps I've hit:
      - the javascript runs in its own scope, but shares a `document` variable

<details><summary>manifest.json</summary>

```json
{
  // the only required fields
  "manifest_version": 2,
  "name": "Firefox Explorer Tweaks",
  "version": "1.0",

  // the important magic
  "content_scripts": [
    {
      "matches": ["file:///*"],
      "js": ["my_script.js"]
    }
  ]
}
```

</details>


<details><summary>simple javascript</summary>

```javascript
// inject a little javascript to be executed by the page.
// you gotta createElement and then append or else it doesn't execute
const s = document.createElement("script")
s.innerHTML = `alert('test')`;
document.body.append(s)
```

</details>


### pdf settings

#### tweaks in `about:config`

for more info see @mozilla
[mozilla/pdf.js/web/ui_utils.js](https://github.com/mozilla/pdf.js/blob/master/web/ui_utils.js) and 
[mozilla/pdf.js/web/app_options.js](https://github.com/mozilla/pdf.js/blob/master/web/app_options.js)
```
  pdfjs.defaultZoomValue = 80%; // this stopped working recently, need to fix
  pdfjs.scrollModeOnLoad = 2;   // lays out pages left to right, with wrapping, as many wide as will fit.
  
  // I also set these two at some point, but I do not remember why.
  pdfjs.enabledCache.state = true;
  pdfjs.migrationVersion = 2;
```

#### UI

<details><summary>CSS</summary>
 
```css
/**
 * CSS TWEAKS FOR pdf.js PDF VIEWER
 * Basic structure:
 *
 *    #outerContainer
 *    ├── #mainContainer
 *    │   ├── #toolbar
 *    │   └── #viewerContainer
 *    │       └── #viewer .pdfViewer[.scrollWrapped]
 *    ├── #sidebarContainer
 *    │   ├── #toolbarSidebar
 *    │   └── #sidebarContent
 *    │       ├── #thumbnailView
 *    │       ├── #outlineView
 *    │       │   ├── .treeItem
 *    │       │   │    ├── .treeItem
 *    ..........................
 *    │       │   │    └── .treeItem
 *    │       │   └── .treeItem
 *    │       ├── #attachmentsView
 *    │       └── #layersView
 *    └── #sidebarResizer
 */
 // TODO: this css is not sufficiently guarded against attaching when it shouldn't!
.pdfViewer.scrollWrapped #viewer .page {
  margin: 0px;
  margin-left: -12px;
  margin-right: 0;
}

.pdfViewer .page {
    margin: 5px auto -3px auto !important;
    border: 1px solid gray !important;
}

html[dir="ltr"] .treeWithDeepNesting > .treeItem, html[dir="ltr"] .treeItem > .treeItems {
    margin-left: -5px !important;
    border-left: 1px solid #444;
    padding-left: 15px !important;
}

.treeItem > a {
    max-height: 2em;
    overflow: hidden;
    margin: -4px 0 0 0 !important;
    border-bottom: 1px solid black;
    text-overflow: ellipsis;
    white-space: nowrap !important;
}

html[dir="ltr"] .treeItemToggler::before {
    right: -2px !important;
    top: -2px;
}

#sidebarContent, #outlineView, #attachmentsView, #layersView {
  overflow-x: scroll !important;
}

```
</details>
</details>
