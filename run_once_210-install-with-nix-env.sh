#!/bin/sh


# Install with nix-env
. "$HOME/.nix-profile/etc/profile.d/nix.sh"
nix-env -i bat
nix-env -i bottom # btm
nix-env -i direnv
nix-env -i du-dust
nix-env -i exa # ls alternative
nix-env -i fd # https://github.com/sharkdp/fd
nix-env -i neofetch
nix-env -iA nixpkgs.fzf
nix-env -iA nixpkgs.gitAndTools.delta
nix-env -i procs # ps
nix-env -i zsh-autosuggestions
