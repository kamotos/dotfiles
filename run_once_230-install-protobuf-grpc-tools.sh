#!/usr/bin/env bash

if [[ "$OSTYPE" == "linux-gnu" ]]; then
	type insomnia
	if [[ "$?" != "0" ]]; then 
		curl -o /tmp/insomnia.deb -L https://updates.insomnia.rest/downloads/ubuntu/latest?&app=com.insomnia.app&source=website
		sudo apt install /tmp/insomnia.deb
	fi	
fi

# grpcurl 
go install github.com/fullstorydev/grpcurl/cmd/grpcurl@latest
