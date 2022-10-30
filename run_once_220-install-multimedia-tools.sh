#!/usr/bin/env bash


install_playerctl() {
	if [[ "$(type playerctl)" == "0" ]]; then
		return 0
	fi

	curl -L -o /tmp/playerctl.deb https://github.com/altdesktop/playerctl/releases/download/v2.4.1/playerctl-2.4.1_amd64.deb

	sudo dpkg -i /tmp/playerctl.deb
}

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	type spotify || snap install spotify

	install_playerctl
fi

