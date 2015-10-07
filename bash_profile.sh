#!/bin/bash

########################################################################
########################################################################

for f in $HOME/.dotfiles/bash/mod_*; do source $f; done
for f in $HOME/.private/*; do
  if [ -f $f ]; then
    source $f;
  fi
done

########################################################################
########################################################################

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
