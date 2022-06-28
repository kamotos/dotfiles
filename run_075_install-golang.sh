#!/usr/bin/env bash
set -euo pipefail

INSTALLED_VERSION=$(go env GOVERSION)
GOLANG_LATEST_VERSION=$(curl https://go.dev/VERSION?m=text)

if [ "$INSTALLED_VERSION" = "$GOLANG_LATEST_VERSION" ] 
then
	exit 0
fi

url=https://golang.org/dl/${GOLANG_LATEST_VERSION}.darwin-amd64.pkg

curl -L -o /tmp/golang-installer.pkg $url

sudo mv /usr/local/go /usr/local/${INSTALLED_VERSION}

open /tmp/golang-installer.pkg



