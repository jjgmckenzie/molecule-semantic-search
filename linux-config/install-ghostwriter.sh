#!/bin/bash
# install-all.sh

# Source common functions that start with _
source ../common-functions.sh

# --- Main Script Starts Here ---

sudo add-apt-repository -y ppa:wereturtle/ppa
_install_apt_package "ghostwriter"