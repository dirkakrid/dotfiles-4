#!/bin/bash

# Encrypted Zip
function ze {
  zip -er protected.zip $2
}

function ar {
  mv {,archive-}$1
}

HAS_BREW=$(which brew)
if [ $? -eq 0 ]; then
  if [ -f $(brew --prefix)/etc/bash_completion  ]; then
   . $(brew --prefix)/etc/bash_completion
  fi
fi

function png2jpeg() {
 FILENAME=$1
 OUTFILE=$(echo $1|cut -d'.' -f 1)
 sips -s format jpeg $FILENAME --out $OUTFILE.jpg
}

# Start the docker machine instance
function ds() {
  IS_RUNNING=$((docker-machine ls | grep dev | grep Running > /dev/null && echo $?) || echo 1)
  if [[ $IS_RUNNING -eq 1 ]]; then
    echo "Starting Docker Machine..."
    docker-machine start dev
  fi

  echo "Setting0 Docker Machine environment..."
  eval $(docker-machine env dev)
}

# Generates A Random string, works with OS X
function randomstring() {
  cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-10} | head -n 1
}
