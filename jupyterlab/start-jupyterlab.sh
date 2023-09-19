#!/bin/bash
# start-jupyterlab.sh
# toby@indieagi.org

# Source common functions that start with _
source $JUPYTERLAB_SCRIPT_DIR/../common-functions.sh
# Fixed name for the virtual environment
VENV_NAME="jupyterlab-venv"
# Check if the directory already exists
if [ ! -d "$JUPYTERLAB_SCRIPT_DIR/$VENV_NAME" ]; then
  $JUPYTERLAB_SCRIPT_DIR/create-venv.sh
fi

source $JUPYTERLAB_SCRIPT_DIR/$VENV_NAME/bin/activate

if ! which "jupyter" > /dev/null 2>&1; then
    $JUPYTERLAB_SCRIPT_DIR/install-jupyterlab.sh
fi

jupyter lab
