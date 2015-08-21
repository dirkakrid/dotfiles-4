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

function p2j() {
 FILENAME=$1
 OUTFILE=$(echo $1|cut -d'.' -f 1)
 sips -s format jpeg $FILENAME --out $OUTFILE.jpg
}
