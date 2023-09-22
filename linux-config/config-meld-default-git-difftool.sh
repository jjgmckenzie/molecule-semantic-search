#!/bin/bash
# config-meld-default-git-difftool.sh
# toby@indieagi.org

# Source common functions that start with _
source ../common-functions.sh

# Configure meld as the default difftool
git config --global diff.tool meld
git config --global merge.tool meld
