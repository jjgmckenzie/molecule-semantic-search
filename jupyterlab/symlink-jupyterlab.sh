#!/bin/bash

source ../common-functions.sh

# Check if ~/.zshrc exists; error if not
if [ ! -f ~/.zshrc ]; then
  _pretty_print_failure "zsh is not installed! install zsh before following these instructions."
  exit 0
fi

# Check if the current shell is "zsh"
if [ "$(basename "$SHELL")" != "zsh" ]; then
    _pretty_print_failure "Error: This script requires the zsh shell."
    exit 1
fi

# sets JUPYTERLAB_SCRIPT_DIR to this directory.
if grep -q "export JUPYTERLAB_SCRIPT_DIR=" ~/.zshrc; then
    sed -i "s#export JUPYTERLAB_SCRIPT_DIR=.*#export JUPYTERLAB_SCRIPT_DIR=\"$(pwd)\"#" ~/.zshrc
  else # If the variable is not exported, add it to the end of the file
    echo "export JUPYTERLAB_SCRIPT_DIR=\"$(pwd)\"" >> ~/.zshrc
fi

# Check if ~/bin directory exists, create it if not
if [ ! -d ~/bin ]; then
  mkdir -p ~/bin
fi

# Add ~/bin to PATH in .zshrc
if [[ ":$PATH:" == *":$HOME/bin:"* ]]; then
    _pretty_print_info "Directory ~/bin is already in PATH."
  else
    # Append the directory to the PATH in the .zshrc file
    echo "export PATH=\"\$PATH:$HOME/bin\"" >> ~/.zshrc
    _pretty_print_info "Directory $HOME/bin added to PATH in ~/.zshrc"
fi
# Source the .zshrc file to apply changes immediately
source ~/.zshrc
if [ -f ~/bin/jupyterlab ]; then
  _pretty_print_info "deleting old symlink"
  rm ~/bin/jupyterlab
fi
ln -s "$(pwd)/start-jupyterlab.sh" ~/bin/jupyterlab
_pretty_print_success "jupyterlab command created successfully"
