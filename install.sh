#!/bin/bash

# Inlcude the helper script
source helpers.sh

# Install dotfiles
if [ ! -d $HOME/.dotfiles ]; then
  log "Downloading"
  git clone https://github.com/mikemackintosh/dotfiles $HOME/.dotfiles
else
  cd $HOME/.dotfiles
  git pull --rebase
fi

# Create private dir
if [ ! -d "${HOME}/.private/" ]; then
  mkdir $HOME/.private
  touch $HOME/.private/nil
fi

# Get readlink
`readlink $HOME/.bash_profile | grep .dotfiles/bash_profile.sh > /dev/null`
BASH=$?
if [ $BASH == 1 ]; then

  # Place bash_profile
  place bash_profile

  # Place curlrc
  place curlrc

  # Place vim
  place vim
  place vim/vimrc $(basename vim/vimrc)

  # Place tmux.conf
  place tmux.conf

fi

# Source the bash_profile we just installed
source ~/.bash_profile

#OS=`uname`
#if [[ $OS == 'Darwin' ]]; then
#  install_osx
#fi
