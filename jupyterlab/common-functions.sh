#!/bin/bash
# common-setup.sh
# toby@indieagi.org

# Define a function for pretty printing
function _pretty_print {
  local msg=$1
  echo -e "${msg_prefix}${msg}${ansi_reset}"
}

# Define a function to check exit status and print appropriate message
function _check_exit_status {
  local msg=$1  # Get the first argument, if any

  if [ $? -ne 0 ]; then
    # If $msg is empty, use the default message. Otherwise, use $msg.
    if [ -z "$msg" ]; then
      _pretty_print "Warning: Last command exit status was $?"
    else
      _pretty_print "Warning: $msg"
    fi
    exit 1
  fi
}


# Define a function to verify if a command exists
function _verify_command_exists {
  local cmd=$1
  local success_msg="The command \`${cmd}\` installed successfully!"
  local fail_msg="Failed to install ${cmd}."

  if which "$cmd" > /dev/null 2>&1; then
    _pretty_print "$success_msg"
  else
    _pretty_print "$fail_msg"
    exit 1
  fi
}


# Function to install an APT package
_install_apt_package() {
    APT_PACKAGE=$1

    # Update package list
    sudo apt update -y

    # Install specified package
    sudo apt install $APT_PACKAGE -y
    _check_exit_status
}

# Define variables for the message prefix and ANSI reset code
msg_prefix="\e[31m$0 >>> "
ansi_reset="\e[0m"
