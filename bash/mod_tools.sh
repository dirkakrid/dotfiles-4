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

function goto() {
  echo "Switching to ${1}..."
  TARGETS=`find $GOPATH/src -name $1 -type d -maxdepth 3`
  arr=()
  while read -r line; do
   arr+=("$line")
  done <<< $TARGETS

  if [ ${#arr[@]} -eq 1 ]; then
    cd "${arr[0]}"
  else
    echo -e "\nWe found more than one location matching you input.\n"
    for i in "${!arr[@]}"; do
      item=$(($i + 1))
      echo "  $item: ${arr[$i]}";
    done

    echo -en "\nPlease choose a destination: "
    read idnum
    itemnum=$(($idnum - 1))
    cd "${arr[itemnum]}"
  fi
}
