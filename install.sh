sudo apt update
# Install python2 and python3 for neovim
sudo apt install -y python
sudo apt install -y curl
sudo apt install -y wget
curl https://bootstrap.pypa.io/pip/2.7/get-pip.py --output get-pip.py
sudo python2 get-pip.py
sudo apt install -y python3 python3-pip
# remove the obsolete get-pip.py
rm ~/.dotfiles/get-pip.py

# Install pynvim for the neovim client
pip2 install pynvim
pip3 install pynvim

# Install NodeJS current *
curl -fsSL https://deb.nodesource.com/setup_17.x | sudo -E bash -
# curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
#curl -fsSL https://deb.nodesource.com/setup_14.x | sude -E bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential 
sudo apt-get install -y tree

# Set local LC_ALL to counteract locale issue with perl
#export LC_ALL=C.UTF-8

# Install fd needed for Telescope in neovim
sudo apt-get install -y fd-find

# Install xsel
sudo apt-get install -y xsel

# Install Anki
sudo apt-get install -y anki

# Install prettier, and other npm packages globally for JavaScript development
sudo npm install -g typescript typescript-language-server eslint_d eslint prettier

# Install the elm language server
sudo npm install -g @elm-tooling/elm-language-server
sudo npm install -g elm elm-test elm-format elm-review

# install the vscode json language server
sudo npm install -g vscode-langservers-extracted

# install the bash language server
sudo npm install -g bash-language-server

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
    nixpkgs.sumneko-lua-language-server \
    nixpkgs.stylua \
    nixpkgs.black \
    nixpkgs.tree-sitter \
    nixpkgs.elmPackages.elm-format \
    nixpkgs.zk

# create symlinks to the dotfiles with stow
stow zsh
stow git
stow nvim 
stow kitty

# add zsh to valid login shells
# FIXME: Before adding the local zsh to the /etc/shells check if it's already there (sed/gawk?)
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shells
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle <~/.zsh_plugins.txt > ~/.zsh_plugins.sh

# install fonts
# sudo apt-get install -y fonts-hack-ttf

# install latest neovim
mkdir -p ~/.local/bin
cd ~/.local/bin
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

# install kitty since the nixos version has issues
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# FIXME The icon for kitty doesn't show in the gnu desktop.
sed -i "s|Icon=kitty|Icon=~/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

# install fonts for icons support in neovim
cd ~/.local/share/fonts/
curl -LO https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf
curl -LO https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf
curl -LO https://github.com/yamatsum/nonicons/blob/master/dist/nonicons.ttf
curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f -v

