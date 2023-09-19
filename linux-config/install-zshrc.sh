#!/bin/bash
# install-oh-my-zsh.sh
# toby@indieagi.org

# Source common functions that start with _
source ../common-functions.sh

# --- Main Script Starts Here ---

# Replace the default ~/.zshrc with your own version-controlled .zshrc
cp ../.zshrc ~/.zshrc  # Replace with your path to the version-controlled .zshrc
_check_exit_status "Failed to replace .zshrc."

_pretty_print_success "Successfully installed .zshrc to ~/.zshrc"
