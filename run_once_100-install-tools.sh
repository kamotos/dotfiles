#!/bin/bash

set -x

#fonts
TTF_FONTS_FOLDER=~/.local/share/fonts/ttf/
mkdir -p $TTF_FONTS_FOLDER
curl -L -o $TTF_FONTS_FOLDER/vscode.ttf https://github.com/Canop/broot/raw/master/resources/icons/vscode/vscode.ttf

# tools
BIN_FOLDER=~/.local/bin
mkdir -p $BIN_FOLDER 

# pip packages
pip install \
  grip # Markdown preview

## ydiff
curl -ksSL https://raw.github.com/ymattw/ydiff/master/ydiff.py > $BIN_FOLDER/ydiff
chmod +x $BIN_FOLDER/ydiff

# shell prompt
curl https://starship.rs/install.sh -sSf | sh -s -- -y

## Install with nix-env
. "$HOME/.nix-profile/etc/profile.d/nix.sh"
nix-env -i bat
nix-env -i bottom # btm
nix-env -i direnv
nix-env -i du-dust
nix-env -i exa # ls alternative
nix-env -i fd # https://github.com/sharkdp/fd
nix-env -i neofetch
nix-env -i procs # ps
nix-env -iA nixpkgs.fzf

# dep packages
SUDO=""
if type sudo
then
    SUDO="sudo"
fi

curl -o /tmp/rescuetime_current_amd64.deb https://www.rescuetime.com/installers/rescuetime_current_amd64.deb
$SUDO dpkg -i /tmp/rescuetime_current_amd64.deb || apt --fix-broken install -y || echo "Installing rescuetime failed"

