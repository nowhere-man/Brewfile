#!/bin/zsh

set -e

## oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
## plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
git clone <https://github.com/zsh-users/zsh-autosuggestions> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone <https://github.com/zsh-users/zsh-syntax-highlighting.git> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone <https://github.com/zsh-users/zsh-completions.git> ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-completions

## brew
REPO_DIR="$(cd -- "$(dirname -- "$0")" && pwd)"
brew bundle --file="$REPO_DIR/.Brewfile"

## git
git config --global user.name "nowhere-man"
git config --global user.email "liu.shaojie@outlook.com"


## edit ~/.zshrc
ZSH_THEME="powerlevel10k/powerlevel10k"
alias ls='eza --icons'
alias ll='eza -lah --icons'
alias la='eza -a --icons'
alias lt='eza --tree --level=2 --icons'
plugins=(git brew zsh-autosuggestions zsh-syntax-highlighting zsh-completions aliases fzf zoxide)

## node
npm install -g jscpd
npm install -g ccstatusline@latest

## uv tools
uv tool install graphifyy