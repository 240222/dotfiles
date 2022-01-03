# dotfiles

# Installation Workflow
1. Clone the [NerdFond](https://github.com/ryanoasis/nerd-fonts) repo and run `./install.sh JetBrainsMono`. 

2. Change the `/etc/pam.d/chsh` file as follows:
`auth sufficient pam_shell.so`
3. Install git `sudo apt-get install git`
4. Clone the repo in .dotfiles directory `git clone https://github.com/el1t1st/dotfiles.git`.
5. `cd .dotfiles`
6. `./install.sh`

After the full install a new kitty terminal should open.

# Remove Workflow

If you want to remove an errorneous install, use the `./cleanup.sh` script. 



