#!/bin/bash

set -x

# Plugins
## zsh-autosuggestions
export ZSH_AUTOSUGGESTIONS_DIR="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions "${ZSH_AUTOSUGGESTIONS_DIR}" || true

git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/evalcache || true
