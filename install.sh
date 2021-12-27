# Install NodeJS current *
#curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
#curl -fsSL https://deb.nodesource.com/setup_14.x | sude -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential 
sudo apt-get install -y tree

# Set local LC_ALL to counteract locale issue with perl
export LC_ALL=C.UTF-8

# Install fd needed for Telescope in neovim
sudo apt-get install -y fd-find

# Install xsel
sudo apt-get install -y xsel

# Install prettier, and other npm packages globally for JavaScript development
sudo npm install -g typescript typescript-language-server eslint_d eslint prettier tree-sitter

# Install nix
curl -L https://nixos.org/nix/install | sh

# Source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# Install packages
nix-env -iA \
    nixpkgs.zsh \
    nixpkgs.git \
    nixpkgs.antibody \
    nixpkgs.neovim \
    nixpkgs.stow \
    nixpkgs.fzf \
    nixpkgs.bat \
    nixpkgs.yarn \
    nixpkgs.ripgrep \
    nixpkgs.gh \
    nixpkgs.yt-dlp
# for yt-dlp in zsh put quotes around the urls

# create symlinks to the dotfiles with stow
stow zsh
stow git
stow nvim
stow kitty

# add zsh to valid login shells
# todo: first check if it is already there (maybe sed?)
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shells
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle <~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install kitty since the nixos version has issues
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

# install fonts
sudo apt-get install -y fonts-hack-ttf
