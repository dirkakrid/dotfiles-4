# Path Replacement
function c() {
  if [[ ! -z $1 && ! -z $2 ]]; then
    cd $(echo $PWD | sed "s/$1/$2/")
    return
  fi

  cd $1
}
