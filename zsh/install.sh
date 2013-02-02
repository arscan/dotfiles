#!/bin/sh

if [ "$SHELL" != "/bin/zsh" ]; then
    command -v zsh >/dev/null 2>&1 || sudo apt-get install zsh
    chsh -s /bin/zsh
    echo "installed zsh. restart the shell in order see the effect"
fi
