#!/bin/bash
# install-vlc.sh
# toby@indieagi.org

# Source common functions that start with _
source ../common-functions.sh

# --- Main Script Starts Here ---

# Update sources and install
_install_apt_package "vlc"
_check_exit_status "Failed to install VLC"

# Verify that the `subl` command is available
_verify_command_exists "vlc"
