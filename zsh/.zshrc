# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Export nvm completion settings for lukechilds/zsh-nvm plugin
# Note: This must be exported before the plugin is bundled
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

# source plugins
source ~/.zsh_plugins.sh

# aliases
alias ls='ls -al'
alias vim='~/.local/bin/nvim.appimage'
alias vi='~/.local/bin/nvim.appimage'
alias nvim='~/.local/bin/nvim.appimage'
alias yt-dlp='yt-dlp -f "bv*[ext=mp4]+ba[ext=m4a]"'
alias kitty='~/.local/kitty.app/bin/kitty'

# nix
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fixing locales
export LC_ALL=C.UTF-8
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
