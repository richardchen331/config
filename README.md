config (easy setup of config files)
======

## Basic Setup

```
mkdir /tmp/setup-config && cd /tmp/setup-config
wget https://raw.githubusercontent.com/richardchen331/config/master/setup.sh
sh setup.sh
cd ~
rm -rf /tmp/setup-config
chsh -s `which zsh`
```

## iTerm2
- Preferences -> Profiles -> Import JSON Profiles (choose iTerm2-Default.json)
- Configurations in this profile
  - Profile -> Colors -> Color Presets: Solarized Dark
  - Profile -> Terminal -> disable "Save lines to scrollback in alternate screen mode" (http://tristanblease.com/post/26765035942/alternate-screen-mode-scrolling-iterm2)
  - Profile -> Keys -> Key Mappings (http://hiltmon.com/blog/2013/02/13/make-iterm-2-more-mac-like/)
    - 4 updated settings: 1) Option <- 2) Option -> 3) Command <- 4) Command ->
- Restart iTerm2
