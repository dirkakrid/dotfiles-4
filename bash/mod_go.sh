function skelgo() {
  echo "Creating application structure for ${1}"
  mkdir -p cmd/$1
  touch cmd/$1/${1}.go
  touch cmd/$1/${1}_test.go
  mkdir -p $1
  touch pkg/.gitkeep
  touch bin/.gitkeep
  touch models/.gitkeep
  touch Makefile
  touch .gitignore
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
