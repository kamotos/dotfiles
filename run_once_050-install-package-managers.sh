#!/bin/bash

# Package managers
# rust - cargo
curl https://sh.rustup.rs -sSf | sh -s -- -y

## pyenv
#curl https://pyenv.run | bash

## oh-my-zsh
# sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# nix-env
# chances are this is docker
# TODO Mac
if ! type sudo
then
    mkdir -p -m 0755 /nix && chown root /nix
fi

sh <(curl -L https://nixos.org/nix/install)

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Vim plugins
VUNDLE_PATH=~/.vim/bundle/Vundle.vim
if ! stat $VUNDLE_PATH > /dev/null;
then
  git clone https://github.com/VundleVim/Vundle.vim.git $VUNDLE_PATH
fi