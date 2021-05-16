#!/bin/sh

#fonts
TTF_FONTS_FOLDER=~/.local/share/fonts/ttf/
mkdir -p $TTF_FONTS_FOLDER
curl -L -o $TTF_FONTS_FOLDER/vscode.ttf https://github.com/Canop/broot/raw/master/resources/icons/vscode/vscode.ttf

# tools
BIN_FOLDER=~/.local/bin
mkdir -p $BIN_FOLDER 

## ydiff
curl -ksSL https://raw.github.com/ymattw/ydiff/master/ydiff.py > $BIN_FOLDER/ydiff
chmod +x $BIN_FOLDER/ydiff


## Install with nix-env
nix-env -i direnv 

# https://github.com/sharkdp/fd
nix-env -i fd 

# btm
nix-env -i bottom

# ps
nix-env -i procs

# ls alternative
nix-env -i exa
