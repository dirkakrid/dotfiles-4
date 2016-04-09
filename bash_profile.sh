#!/bin/bash

# Load bash and private
#for f in $HOME/.dotfiles/bash/dsl/*_dsl.sh; do source $f; done
for f in $HOME/.dotfiles/bash/*.sh; do source $f; done
for f in $HOME/.private/*; do
  if [ -f $f ]; then
    source $f;
  fi
done

# If iTerm2 Shell Integrations exists, load it
if [[ -e ${HOME}/.iterm2_shell_integration.bash ]]; then
  source ${HOME}/.iterm2_shell_integration.bash
fi
