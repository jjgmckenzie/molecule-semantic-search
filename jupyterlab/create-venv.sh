#!/bin/bash
# create-venv.sh
# toby@indieagi.org

# Source common functions that start with _
source $JUPYTERLAB_SCRIPT_DIR/../common-functions.sh

# Fixed name for the virtual environment
VENV_NAME="jupyterlab-venv"

# Check if the directory already exists
if [ -d "$JUPYTERLAB_SCRIPT_DIR/$VENV_NAME" ]; then
    _pretty_print_failure "Directory $JUPYTERLAB_SCRIPT_DIR/$VENV_NAME already exists. Choose another name or remove the existing directory."
    exit 1
fi

# Create virtual environment
python3 -m venv $JUPYTERLAB_SCRIPT_DIR/$VENV_NAME

# Check if the virtual environment was created successfully
if [ $? -eq 0 ]; then
    _pretty_print_success "Virtual environment $VENV_NAME created successfully."
else
    _pretty_print_failure "Failed to create virtual environment."
    exit 1
fi
