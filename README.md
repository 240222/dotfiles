# dotfiles

1. Change the `/etc/pam.d/chsh` file as follows:
`auth sufficient pam_shell.so`
2. Install git `sudo apt-get install git`
3. Clone the repo in .dotfiles directory `git clone https://github.com/el1t1st/dotfiles.git`.
4. `cd .dotfiles`
5. `./install.sh`

After the full install a new kitty terminal should open.

If you want to remove an errorneous install, use the `./cleanup.sh` script. 



