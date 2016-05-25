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

_goto()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $( compgen -W "$(find $GOPATH/src -type d -maxdepth 3 -exec basename {} \;)" -- "$cur" ) )
    return 0
}
complete -F _goto goto

# Go list deps that are not standard for the
function golist(){
  PROJ=$1
  if [[ -z $1 ]]; then
    PROJ="./..."
  fi

  go list -f '{{.Deps}}' $PROJ | tr "[" " " | tr "]" " " | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}'
}


# GoSkel creates a project skeleton for golang projects
function goskel(){
  PROJECT=$1
  if [[ -z $1 ]]; then
    echo "Please provide a project name and re-run."
    exit 1
  fi

  # Create directories
  echo "Creating $PROJECT skeleton"
  echo " --> Adding bin, libs and testing directories"
  mkdir -p $PROJECT/{bin,libs,testing}

  # Add flatfiles
  echo " --> Adding license, todos and readme"
  touch $PROJECT/{TODOS,LICENSE,README.md}

  # Add a gitignore
  echo " --> Adding .gitignore"
  echo "bin/*" > $PROJECT/.gitignore

  # Adding a main.go
  echo " --> Adding main.go"
  echo -e "package main\n\nfunc main() {\n\n}\n" > $PROJECT/main.go

  # Creating makefile
  echo " --> Adding Makefile"
  echo -e "all: test build\n\ntest:\n\nbuild:\n\tgo build -o bin/$PROJECT main.go" > $PROJECT/Makefile

  # Return status
  echo "Created project $PROJECT successfully."

}
