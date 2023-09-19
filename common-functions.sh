#!/bin/bash
# common-functions.sh
# toby@indieagi.org

# Define a function for pretty printing
function _pretty_print {
  local msg=$1
  echo -e "${msg_prefix}${msg}${ansi_reset}"
}

function _pretty_print_info {
  local msg=$1
  echo -e "${msg_prefix_info}${msg}${ansi_reset}"
}

function _pretty_print_success {
  local msg=$1
  echo -e "${msg_prefix_success}${msg}${ansi_reset}"
}

function _pretty_print_failure {
  local msg=$1
  echo -e "${msg_prefix_failure}${msg}${ansi_reset}"
}

# Define a function to check exit status and print appropriate message
function _check_exit_status {
  local msg=$1  # Get the first argument, if any

  if [ $? -ne 0 ]; then
    # If $msg is empty, use the default message. Otherwise, use $msg.
    if [ -z "$msg" ]; then
      _pretty_print_failure "Warning: Last command exit status was $?"
    else
      _pretty_print_failure "Warning: $msg"
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
    _pretty_print_success "$success_msg"
  else
    _pretty_print_failure "$fail_msg"
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
    _check_exit_status "APT install returned failure."
}

# Checks if any packages exist on this system that may conflict with the packages
# and dependencies to be installed with the requested pip package
_check_for_python_package_conflicts() {
    PIP_PACKAGE=$1

    # Store the current Python packages in a variable
    current_packages=$(pip freeze)

    # Simulate installing the package to see what packages will be installed or upgraded
    simulated_install=$(pip install --dry-run "$PIP_PACKAGE" --break-system-packages)

    # Check if the simulated install tries to upgrade any existing package
    conflicts=0
    while read -r line; do
        package=$(echo "$line" | cut -d '=' -f 1)
        if echo "$simulated_install" | grep -q "$package"; then
            _pretty_print_failure "Warning: Installing $PIP_PACKAGE might upgrade $package, leading to potential conflicts."
            conflicts=1
        fi
    done <<< "$current_packages"

    # Exit if conflicts were found
    if [ "$conflicts" -ne 0 ]; then
        _pretty_print_failure "Error: pip package conflicts detected with system packages. Aborting installation."
        exit 1
    else
        _pretty_print_success "No conflicts detected between $PIP_PACKAGE and system-installed Python packages."
    fi
}

_install_python_package_to_system() {
  PIP_PACKAGE=$1
  _check_for_python_package_confligs "$PIP_PACKAGE"

  pip install "$PIP_PACKAGE" --break-system-packages
  _check_exit_status "pip install returned failure"
}

# Define variables for the message prefix and ANSI reset code
msg_prefix="\e[31m$0 >>> "
msg_prefix_success="\e[32m$0 >>> "  # green
msg_prefix_failure="\e[31m$0 >>> "  # red
msg_prefix_info="\e[34m$0 >>> "     # blue
ansi_reset="\e[0m"
