# Setting up Command Logging with Graylog

## Overview

This guide demonstrates how to log commands executed in the terminal to a specific file using Graylog. By leveraging the Bash history feature and the PROMPT_COMMAND variable, we can capture command executions and store them in a log file.

## Setup

### 1. Editing .bashrc for all Users

Open the `.bashrc` file for editing:

```bash
sudo nano /etc/bash.bashrc
```

Add the following lines at the end of the file:

```bash
# Function to log commands
log_command() {
    local command=$(history 1 | { read _ cmd; echo "$cmd"; })
    local current_directory=$(pwd)
    local hostname=$(hostname)
    local username=$(whoami)
    local ip_address=$(hostname -I | cut -d' ' -f1)  # Replace '1' with the appropriate field number if multiple IP addresses are available
    
    echo "$(date +"%Y-%m-%d %T") - $username@$hostname($ip_address) - [$(pwd)] - $command" >> /var/log/cmd.log
}

# Configure PROMPT_COMMAND to call log_command before displaying the prompt
PROMPT_COMMAND=log_command
```

These commands define a function `log_command` that captures the last executed command from the Bash history and appends it, along with the timestamp and username, to the `/var/log/cmd.log` file.

### 2. Creating the Log File

Create the log file `/var/log/cmd.log`:

```bash
sudo touch /var/log/cmd.log
sudo chmod 666 /var/log/cmd.log
sudo chown root:adm /var/log/cmd.log
```

These commands create the log file and set the permissions to allow all users to write logs to it. The ownership is set to `root:adm`, where `adm` is commonly used for system logging purposes.

### 3. Configuring rsyslog

Create a configuration file for rsyslog to process the log file:

```bash
sudo nano /etc/rsyslog.d/cmd.conf
```

Add the following content to `cmd.conf`:

```plaintext
# Load imfile module
module(load="imfile")

# Monitor the log file
input(type="imfile"
      File="/var/log/cmd.log"
      Tag="cmd"
      Facility="local7"
      Severity="info"
      )

# Define a template to format log messages
$template cmdTemplate,"%msg%\n"

# Send logs to Graylog server
local7.* @graylog_server_ip:514;RSYSLOG_SyslogProtocol23Format
```

Replace `graylog_server_ip` with the IP address of your Graylog server. This configuration sets up rsyslog to monitor the `/var/log/cmd.log` file and forward its contents to the Graylog server.

### 4. Restarting Services

After making changes to the `.bashrc` file, creating the log file, and configuring rsyslog, restart the `rsyslog` service to apply the changes:

```bash
sudo systemctl restart rsyslog
```

### 5. Setting up Graylog Inputs

In the Graylog web interface, navigate to System > Inputs.

Create a new input of type Syslog UDP.

Configure the input to listen on port 514 (or any desired port) and select the appropriate node and extractors as needed.

## Usage

After completing the setup, every command executed in the terminal will be logged to `/var/log/cmd.log` with the timestamp and username. These logs will be forwarded to the configured Graylog server for further analysis and visualization.

## Note

- Ensure that the log file `/var/log/cmd.log` is monitored by Graylog through rsyslog for proper forwarding.
- Adjustments can be made to the setup as needed based on your specific requirements and environment.
```

With these updates, the README.md file provides detailed instructions, including how to modify `.bashrc` for all users.
