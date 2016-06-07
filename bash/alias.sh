# Highlight
alias show="highlight -O ansi"

# Encrypted Zip
function ze {
  zip -er protected.zip $2
}

# Archie a directory by prefixing it with zzarchive
function ar {
  mv {,zzarchive-}$1
}


# Convert a png to a jpg
function p2j() {
 FILENAME=$1
 OUTFILE=$(echo $1|cut -d'.' -f 1)
 sips -s format jpeg $FILENAME --out $OUTFILE.jpg
}

# Generates A Random string, works with OS X
function randomstring() {
  cat /dev/urandom | LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w ${1:-10} | head -n 1
}

# Replace <1> with <2> in the directory
function replace() {
  find_this="$1"
  replace_with="$2"
  ag -l --nocolor "$find_this" $* | xargs sed -i '' "s/$find_this/$replace_with/g"
}
