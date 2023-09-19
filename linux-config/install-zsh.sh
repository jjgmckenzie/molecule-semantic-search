#!/bin/bash
# install-zsh.sh
# toby@indieagi.org

# Source common functions that start with _
source ../common-functions.sh

# --- Main Script Starts Here ---

# Install Zsh
_install_apt_package "zsh"
_check_exit_status "Failed to install Zsh."

# Verify that the `zsh` command is available
_verify_command_exists "zsh"
