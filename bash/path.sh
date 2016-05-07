# If you have $PROTECTED_PATH, hide it
function hidepath() {
  if [[ -z $HIDE_PATH ]]; then
    export HIDE_PATH=$PROTECTED_PATH
    return
  fi
  unset HIDE_PATH
}

# Show path, opposite of hidepath
function showpath() {
  unset HIDE_PATH
}

# Short path sumarizes your $PWD in $PROMPT
function shortpath() {
  if [[ ! -z $SHORTPATH ]]; then
    unset SHORTPATH
    return
  fi
  export SHORTPATH=true
}

# Set some wonderful path stuff
export GOPATH="${HOME}/go"
unset PATH
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
PATH="/usr/local/sbin:$PATH"
PATH="$HOME/bin:$PATH"
PATH="$HOME/Library/Android/sdk/platform-tools:$PATH"
PATH="/usr/local/opt/go/libexec/bin:$PATH:${GOPATH}/bin"
export PATH
