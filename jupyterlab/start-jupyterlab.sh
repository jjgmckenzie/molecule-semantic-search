#!/bin/bash
# start-jupyterlab.sh
# toby@indieagi.org

# Check if the current shell is "zsh"
if [ "$(basename "$SHELL")" != "zsh" ]; then
  # This cannot be _pretty_print_failure as if shell is not zsh, pretty_print cannot be imported. 
  echo ">> Error: This script requires the zsh shell."
  exit 1
fi

# Source common functions that start with _
source $JUPYTERLAB_SCRIPT_DIR/../common-functions.sh

_pretty_print_info "common scripts loaded, running start-jupyterlab"

# Fixed name for the virtual environment
VENV_NAME="jupyterlab-venv"
# Check if the directory already exists
if [ ! -d "$JUPYTERLAB_SCRIPT_DIR/$VENV_NAME" ]; then
  _pretty_print_info "Virtual environment does not exist; creating"
  $JUPYTERLAB_SCRIPT_DIR/create-venv.sh
fi

source $JUPYTERLAB_SCRIPT_DIR/$VENV_NAME/bin/activate

_pretty_print_info "Entered Virtual Environment"

if which "jupyter" > /dev/null 2>&1; then
      _pretty_print_info "Jupyter found"
  else
    _pretty_print_info "Jupyter not found, installing"
    $JUPYTERLAB_SCRIPT_DIR/install-jupyterlab.sh
fi

_pretty_print_info "Running Jupyter Lab in $(pwd)"
jupyter lab
