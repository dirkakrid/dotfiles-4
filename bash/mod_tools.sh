#!/bin/bash

# Encrypted Zip
function ze {
  zip -er protected.zip $2
}

function ar {
  mv {,archive-}$1
}

if [ -f $(brew --prefix)/etc/bash_completion  ]; then
   . $(brew --prefix)/etc/bash_completion
 fi
