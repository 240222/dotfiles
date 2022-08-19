# Portable Development Environment

- zsh (kitty is available)
- nvim
- haskell, lua, bash, sql, markdown, yaml
- support for Chinese (run ibus-setup to set the entry panel)

## Installation Workflow

1. Change the `/etc/pam.d/chsh` file as follows:
   `auth sufficient pam_shell.so`
2. Install git `sudo apt-get install git`
3. Clone the repo in .dotfiles directory `git clone https://github.com/el1t1st/dotfiles.git ~/.dotfiles`.
4. `cd .dotfiles`
5. `./install.sh`

Note: There may be issues with /nix directory, if you use the same portable environment for other accounts on the same machine.

# Post-install Neovim

1. Run `:PackerSync` or `:PackerInstall`. This will install the needed packages.

# Remove Workflow

If you want to remove an errorneous install, use the `./cleanup.sh` script. This script not just removes the .local and .config and all dotfiles, but also the /nix directory.
