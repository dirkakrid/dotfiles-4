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
  eval $(docker-machine env dev)
}

# MOST AWESOMEST THING EVER
function goto() {
  echo -n "Switching to ${1}..."
  TARGETS=($(find $GOPATH/src -name $1 -type d -maxdepth 3))
  TARGET_COUNT=${#TARGETS[@]}
  if [ $TARGET_COUNT -eq 0 ]; then
    echo " Sorry! No matching dirs"
    return
  elif [ $TARGET_COUNT -eq 1 ]; then
    cd "${TARGETS[0]}"
  else
    echo -e "\nWe found more than one location matching you input.\n"
    for i in "${!TARGETS[@]}"; do
      item=$(($i + 1))
      echo "  $item: ${TARGETS[$i]}";
    done

    echo -en "\nPlease choose a destination: "
    read idnum
    itemnum=$(($idnum - 1))
    echo "Switching to ${TARGETS[itemnum]}"
    cd "${TARGETS[itemnum]}"
  fi
}

# Generates A Random string, works with OS X
function randomstring() {
  cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-10} | head -n 1
}
