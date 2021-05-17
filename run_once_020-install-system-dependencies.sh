#!/bin/sh

OS_DEPENDENCIES="build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git python3-dev:"


# sudo isn't necessary available in docker images
if type sudo
then
    sudo apt install -y $OS_DEPENDENCIES
    exit
fi

apt install -y $OS_DEPENDENCIES
