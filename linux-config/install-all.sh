#!/bin/bash
# install-all.sh

# Source common functions that start with _
source ../common-functions.sh

# --- Main Script Starts Here ---

./install-zsh.sh
./install-oh-my-zsh.sh # also sets zsh as default
./install-zshrc.sh # configuration of zsh


./install-xclip.sh # allows you to do echo "hello" | xclip to copy hello to clipboard

# ./install-python-dotenv.sh # dont think we need this but leaving it in case
./install-python-venv.sh


./install-meld.sh # graphical difftool
./config-meld-default-git-difftool.sh
./install-obs.sh
./install-vlc.sh
./install-ghostwriter.sh
