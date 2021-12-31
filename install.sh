sudo apt update
# Install python2 and python3 for neovim
sudo apt install python
sudo apt install curl
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo apt install python3 python3-pip

# Install pynvim for the neovim client
pip2 install pynvim
pip3 install pynvim

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

# Install the elm language server
sudo npm install -g @elm-tooling/elm-language-server
sudo npm install -g elm elm-test elm-format elm-review

# install the vscode json language server
sudo npm install -g vscode-langservers-extracted

# Install the nvim package manager packer nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install nix
curl -L https://nixos.org/nix/install | sh

# Source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# Install packages
nix-env -iA \
    nixpkgs.zsh \
    nixpkgs.antibody \
    nixpkgs.stow \
    nixpkgs.fzf \
    nixpkgs.bat \
    nixpkgs.yarn \
    nixpkgs.ripgrep \
    nixpkgs.gh \
    nixpkgs.yt-dlp \
    nixpkgs.sumneko-lua-language-server

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
# sudo apt-get install -y fonts-hack-ttf

# install fonts with support for glyphs
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"

# install latest neovim
mkdir -p ~/.local/bin
cd ~/.local/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
