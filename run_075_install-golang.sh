#!/usr/bin/env bash
set -euxo pipefail

INSTALLED_VERSION=$(go env GOVERSION || echo "")
GOLANG_LATEST_VERSION=$(curl https://go.dev/VERSION?m=text | head -n 1)

if [ "$INSTALLED_VERSION" = "$GOLANG_LATEST_VERSION" ] 
then
	exit 0
fi

# Nothing to move during first installation
if [ "$INSTALLED_VERSION" != "" ]
then
	sudo mv /usr/local/go /usr/local/${INSTALLED_VERSION}
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
	url=https://golang.org/dl/${GOLANG_LATEST_VERSION}.darwin-amd64.pkg
	curl -L -o /tmp/golang-installer.pkg $url
	open /tmp/golang-installer.pkg
else 	
	FILENAME=${GOLANG_LATEST_VERSION}.linux-amd64.tar.gz
	url=https://golang.org/dl/$FILENAME
	curl -L -o /tmp/$FILENAME $url
	sudo tar -C /usr/local -xzf /tmp/$FILENAME
fi





