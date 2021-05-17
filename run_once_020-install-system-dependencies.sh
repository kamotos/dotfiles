#!/bin/sh

OS_DEPENDENCIES="libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git python3-dev flameshot sqlite3 libsqlite3-dev i3lock-fancy pulseaudio-utils xbacklight build-essential"

SUDO=""
if type sudo
then
    SUDO="sudo"
fi

# sudo isn't necessary available in a docker image build
$SUDO apt install -y $OS_DEPENDENCIES
