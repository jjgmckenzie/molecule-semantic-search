#!/bin/bash
# install-zsh.sh
# toby@indieagi.org

# Source common functions that start with _
source ../common-functions.sh

# --- Main Script Starts Here ---

# Install xclip
_install_apt_package "xclip"
_check_exit_status "Failed to install xclip"

# Verify that the `xclip` command is available
_verify_command_exists "xclip"
