#!/bin/bash

# Set some wonderful path stuff
unset PATH
export GOPATH="${HOME}/go"
export PATH="/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Check for personal bin
if [[ -d "$HOME/bin" ]]; then
  export PATH="$HOME/bin:$PATH"
fi

# Add in Android on OSX if it exists
if [[ -d "$HOME/Library/Android/sdk/platform-tools" ]]; then
  export PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
fi

# Add in GOBIN and PATH if it exists
if [[ -d "/usr/local/opt/go/libexec/bin" ]]; then
  export PATH="/usr/local/opt/go/libexec/bin:$PATH:${GOPATH}/bin"
fi

# Set default editor
export EDITOR=vim

# Load bash and private
for f in $HOME/.dotfiles/bash/*.sh; do source $f; done

# Load all the source files
for f in $HOME/.private/*; do
  if [[ -f $f ]]; then
    source $f;
  fi
done

# If iTerm2 Shell Integrations exists, load it
if [[ -e ${HOME}/.iterm2_shell_integration.bash ]]; then
  source ${HOME}/.iterm2_shell_integration.bash
fi
