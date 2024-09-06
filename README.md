# Mac config tricks

Any time I have to figure out how to do something, I try to remember to put it here.

[link](mac_config_tricks.md)

# useful functions

[link](useful_functions.md)

# Guide to setting up a new computer

## the old way (2018)

[link](README_orig.md)

A weird mishmash of mac and ubuntu stuff. 10 years of collected configs, updated haphazardly.

## Mac Mini (2021) initial setup:

[link](logs/mac_mini_2021.md)

## Windows Computers for work (2021)

[firefox](firefox.md)
[autohotkey](autohotkey.md)
[aText](aText.md)
[poweerToys](powerToys.md)


## jupyter lab autoreload

~/.ipython/profile_default/ipython_config.py
```
c.InteractiveShellApp.exec_lines.append('%load_ext autoreload')
c.InteractiveShellApp.exec_lines.append('%autoreload 2')
```
