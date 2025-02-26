# ssh-into

A simple command-line utility that makes SSH connections easier by managing a list of your frequently used servers.

## Overview

`ssh-into` helps you manage and connect to your SSH servers using friendly names instead of remembering IP addresses and usernames. It provides an interactive menu to select the server you want to connect to, making SSH connections more convenient.

## Features

- Store SSH connection details with memorable names
- Interactive selection menu for connecting to servers
- Easy commands to add, edit, and remove servers
- Simple text-based configuration file for compatibility and ease of use
- Works on any Linux or Unix-based system with Bash

## Installation

### Quick Install

Option 1: Using the install script
```bash
curl -sSL https://raw.githubusercontent.com/sebscholl/ssh-into-tool/refs/heads/main/install.sh | bash
```

Option 2: Manual installation
```bash
# Clone the repository
git clone https://github.com/yourusername/ssh-into-tool.git

# Copy the script to a directory in your PATH
sudo cp ssh-into-tool/ssh-into /usr/local/bin/

# Make it executable
sudo chmod +x /usr/local/bin/ssh-into
```

### Manual Installation

1. Download the `ssh-into` script
2. Make it executable: `chmod +x ssh-into`
3. Move it to a directory in your PATH: `sudo mv ssh-into /usr/local/bin/`

## Usage

### Basic Usage

Just run `ssh-into` without any arguments to see an interactive list of your servers:

```bash
$ ssh-into
Select a server to connect to:
  1. webserver - john@192.168.1.10
  2. database - admin@192.168.1.20
Enter selection (1-2):
```

### Command Line Options

| Option | Description | Example |
|--------|-------------|---------|
| `-a, --add` | Add a new server | `ssh-into -a webserver john@192.168.1.10` |
| `-e, --edit` | Edit a server name | `ssh-into -e webserver web-prod` |
| `-r, --remove` | Remove a server | `ssh-into -r webserver` |
| `-l, --list` | List all servers | `ssh-into -l` |
| `-h, --help` | Display help message | `ssh-into -h` |

### Examples

Add a new server:
```bash
ssh-into -a webserver john@192.168.1.10
```

Rename a server:
```bash
ssh-into -e webserver web-prod
```

Remove a server:
```bash
ssh-into -r webserver
```

List all saved servers:
```bash
ssh-into -l
```

## Configuration

The tool stores your server list in a simple text file at `~/.ssh/servers.txt`. The format is:

```
# Server list format: NAME USERNAME@IP
webserver john@192.168.1.10
database admin@192.168.1.20
```

You can edit this file directly if you prefer, or use the provided command-line options.

## Advanced Usage Tips

### Add SSH Keys

For password-less connections, set up SSH key authentication:

```bash
# Generate SSH key (if you don't already have one)
ssh-keygen -t rsa -b 4096

# Copy your key to the server
ssh-copy-id username@server-ip
```

### Custom SSH Options

For servers requiring special SSH options, you can create entries in your `~/.ssh/config` file and then reference them in `ssh-into`:

```bash
# In ~/.ssh/config
Host webserver-tunnel
    HostName 192.168.1.10
    User john
    Port 2222
    LocalForward 8080 localhost:80

# Then add to ssh-into
ssh-into -a web-tunnel john@webserver-tunnel
```

## Troubleshooting

- **Permission denied error**: Make sure the script is executable (`chmod +x /path/to/ssh-into`)
- **Command not found**: Ensure the script is in your PATH
- **SSH connection issues**: Verify you can connect directly with `ssh username@ip` before using `ssh-into`

## Contributing

Contributions are welcome! Feel free to submit pull requests or open issues for bugs and feature requests.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Inspired by the need to simplify SSH connections to multiple servers
- Thanks to the Bash community for scripting best practices