#!/usr/bin/sh

## macOS Preferences

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Add a context menu item for showing the Web Inspector in web views
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Store screenshots in subfolder on desktop
mkdir ~/Desktop/Screenshots
defaults write com.apple.screencapture location ~/Desktop/Screenshots


## Github
ssh-keygen -t rsa -C "kevin@`hostname -s`"

# Copy public key to Github.com
# cat ~/.ssh/id_rsa.pub

# Test connection
ssh -T git@github.com

# Git global config
git config --global user.name "Kevin Elliott"
git config --global user.email "kevin@welikeinc.com"
git config --global github.user kevinelliott
# git config --global github.token your_token_here

git config --global core.editor "code -w"
git config --global color.ui true
