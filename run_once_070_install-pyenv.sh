#!/usr/bin/env bash
set -euo pipefail

#DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
#. "$DIR/base.sh"

#PYTHON_REQUIREMENTS="$DIR/requirements.txt"
# see github.com/pyenv/pyenv/issues/1219
if [[ "$OSTYPE" == "darwin"* ]]; then
	export LDFLAGS="-L/usr/local/opt/zlib/lib"
fi

PYENV_DIR="$HOME/.pyenv"
if [ ! -d "$PYENV_DIR" ]; then
	curl https://pyenv.run | bash
	export PATH="$HOME/.pyenv/bin:$PATH"
	# Latest python version.
	PYTHON_VERSION=$(pyenv install -l | grep '\s[0-9].[0-9]*.[0-9]*$' | sort -r | head -n 1)
	pyenv install -s $PYTHON_VERSION
fi

PYTHON_VERSION=$(pyenv install -l | grep '\s[0-9].[0-9]*.[0-9]*$' | sort -r | head -n 1)
eval "$(pyenv init -)"
pyenv local $PYTHON_VERSION
#pip install --upgrade -r $PYTHON_REQUIREMENTS
#mv $DIR/../.python-version $HOME
