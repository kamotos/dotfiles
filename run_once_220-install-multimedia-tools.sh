#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	type spotify || snap install spotify
fi
