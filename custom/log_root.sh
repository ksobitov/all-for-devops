#!/bin/bash

log_file="/var/log/custom.log"

# Function to log commands
log_command() {
    echo "$(date): $1" >> "$log_file"
}

# Function to monitor su -l <someuser> command
monitor_su() {
    local user="$1"
    local command="su -l $user"
    if history | grep -q "$command"; then
        log_command "User $(whoami) ran: $command"
    fi
}

# Function to monitor sudo -i command
monitor_sudo() {
    local command="sudo -i"
    if history | grep -q "$command"; then
        log_command "User $(whoami) ran: $command"
    fi
}

# Main function to monitor both commands
main() {
    monitor_su "<someuser>"
    monitor_sudo
}

main
