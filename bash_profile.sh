#!/bin/bash

########################################################################
########################################################################
#if [[ "$TERM" != "screen-256color" ]]; then
#  tmux attach-session -t "$USER" || tmux new-session -s "$USER"
#  exit
#fi

for f in $HOME/.dotfiles/bash/mod_*; do source $f; done
for f in $HOME/.private/*; do
  if [ -f $f ]; then
    source $f;
  fi
done

########################################################################
########################################################################

test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
