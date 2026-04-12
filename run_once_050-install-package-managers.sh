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
    mkdir -p /etc/nix
    export USER=root
    echo "build-users-group =" > /etc/nix/nix.conf
fi

sh <(curl -L https://nixos.org/nix/install)

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

# Vim plugins
VIM_PLUG_PATH=~/.vim/autoload/plug.vim
if [ ! -f "$VIM_PLUG_PATH" ];
then
  mkdir -p ~/.vim/autoload
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# zsh
if ! stat ~/.oh-my-zsh/ > /dev/null;
then
  export KEEP_ZSHRC=yes
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
