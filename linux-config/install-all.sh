#!/bin/bash
# install-all.sh

# Source common functions that start with _
source ../common-functions.sh

# --- Main Script Starts Here ---

./install-zsh.sh
_check_exit_status "last install script failed"
./install-oh-my-zsh.sh # also sets zsh as default
_check_exit_status "last install script failed"
./install-zshrc.sh # configuration of zsh
_check_exit_status "last install script failed"

./install-xclip.sh # allows you to do echo "hello" | xclip to copy hello to clipboard
_check_exit_status "last install script failed"

# ./install-python-dotenv.sh # dont think we need this but leaving it in case
./install-python-venv.sh
_check_exit_status "last install script failed"

./install-meld.sh # graphical difftool
_check_exit_status "last install script failed"
./install-obs.sh
_check_exit_status "last install script failed"
./install-vlc.sh
_check_exit_status "last install script failed"
