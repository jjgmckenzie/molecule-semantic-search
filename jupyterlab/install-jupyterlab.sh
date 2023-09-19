#!/bin/bash
# install-jupyterlab.sh
# toby@indieagi.org

# Source common functions that start with _
source $JUPYTERLAB_SCRIPT_DIR/../common-functions.sh

# --- Main Script Starts Here ---

pip install jupyterlab
_check_exit_status "Failed to install JupyterLab"

_verify_command_exists "jupyter"
