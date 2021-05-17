#!/bin/sh

OS_DEPENDENCIES="build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git python3-dev flameshot pactl xbacklight"

SUDO=""
if type sudo
then
    SUDO="sudo"
fi

# sudo isn't necessary available in a docker image build
$SUDO apt install -y $OS_DEPENDENCIES
