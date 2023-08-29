sudo apt update
# Install python2 and python3 for neovim
# FIX: Before installing first check if an app exists already
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
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
# curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
#curl -fsSL https://deb.nodesource.com/setup_14.x | sude -E bash -
# sudo apt-get install -y nodejs
sudo apt-get install -y build-essential 
sudo apt-get install -y tree

# Set local LC_ALL to counteract locale issue with perl
export LC_ALL=C.UTF-8

# Install fd needed for Telescope in neovim
sudo apt-get install -y fd-find

# Install xsel
sudo apt-get install -y xsel

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
    nixpkgs.sumneko-lua-language-server \
    nixpkgs.stylua \
    nixpkgs.black \
    nixpkgs.tree-sitter \
    nixpkgs.zk

# create symlinks to the dotfiles with stow
stow zsh
stow git
stow nvim 
stow kitty
# create a symlink to the mochi.desktop file
stow mochi

# add zsh to valid login shells
# FIX: Before adding the local zsh to the /etc/shells check if it's already there (sed/gawk?)
#command -v zsh | sudo tee -a /etc/shells

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

# install mochi.cards
# FIX Check latest Mochi version on mochi.cards
cd ~/.local/bin
curl -LO https://mochi.cards/releases/Mochi-1.15.15.AppImage
chmod u+x Mochi-1.15.15.AppImage
ln -s Mochi-1.15.15.AppImage mochi

# install kitty since the nixos version has issues
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If the icon for kitty doesn't show in the gnu desktop.
sed -i "s|Icon=kitty|Icon=~/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

# install fonts for icons support in neovim
# INFO: Only activate for a fresh install
cd ~/.local/share/fonts/
curl -LO https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf
curl -LO https://github.com/googlefonts/noto-emoji/blob/main/fonts/NotoColorEmoji.ttf
curl -LO https://github.com/yamatsum/nonicons/blob/master/dist/nonicons.ttf
curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
curl -LO https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f -v

# Install OCAML opam package manager
# curl -fsSL https://raw.githubusercontent.com/ocaml/master/shell/install.sh
# sudo apt-get -y install opam
# opam init
# eval $(opam env)
# opam switch create 4.14.0
# eval $(opam env)
# which ocaml
# ocaml -version
# opam install dune utop ocaml-lsp-server

# Install the haskell stack
# wget -qO- https://get.haskellstack.org/ | sh
# stack upgrade
# # Install ghcup to manage the haskell toolkit
# curl --proto 'https://' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
# # Install the haskell-language-server for neovim
# curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

# INFO Install haskell-language-server and haskell-language-server-wrapper

# Install wally flashing tool for Ergodox
cd ~/.local/bin
curl -LO https://configure.ergodox-ez.com/wally/linux
mv linux wally
chmod u+x wally

# Install support for chinese
sudo apt install -y fonts-arphic-bkai00mp
sudo apt install -y xfonts-intl-chinese
sudo apt install -y xfonts-intl-chinese-big
sudo apt install -y ibus-libpinyin
# You may need to run sudo dpkg-reconfigure locales to add the simplified Chinese locale zh_...UTF8

# Install app for Boox e-ink Mira screen
cd ~/.local/bin
curl -LO https://static.send2boox.com/monitor-pc/linux/Mira-latest.AppImage
chmod u+x Mira-latest.AppImage
ln -s Mira-latest.AppImage mira

# Install scrcpy to mirror Boox Note Air 2 screen

# Install the rust-analyzer
cd ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod u+x rust-analyzer


# Install the rust development environment
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install lldb for dap in neovim
sudo apt install -y lldb

# Install vapigen for installation of libadwaita
sudo apt install -y valac

# Install libadwaita
# sudo apt install libadwaita-1-dev
# Install yt-dlp 
cd ~/.local/bin
curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp -o ~/.local/bin/yt-dlp
cmod u+x yt-dlp
