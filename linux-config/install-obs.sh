#!/bin/bash
# install-vlc.sh
# toby@indieagi.org

# Source common functions that start with _
source ../common-functions.sh

# --- Main Script Starts Here ---

sudo add-apt-repository -y ppa:obsproject/obs-studio
_install_apt_package "ffmpeg"
_install_apt_package "obs-studio"