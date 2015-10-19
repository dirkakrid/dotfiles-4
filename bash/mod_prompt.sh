#!/bin/bash

# Reload
function reload {
#    source $HOME/.zshrc
    source $HOME/.bash_profile
}

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

# Sets the prompt right
function prompt_right() {
  #echo -e "$SPLG_ORANGE[$SPLG_PINK\A$SPLG_ORANGE]"
  echo -e "\[$SPLG_ORANGE\][\[$SPLG_PURPLE\]\#\[$SPLG_ORANGE\]|\[$SPLG_PINK\]\A\[$SPLG_ORANGE\]]"
}

# Sets the prompt left
function prompt_left() {
  #CPATH="$SPLG_DGREY$(dirname $PWD)/$SPLG_ORANGE$(basename $PWD)"
  #echo -e "$SPLG_LBLUE\u$SPLG_LGREY@$SPLG_DBLUE\h $SPLG_PINK[$CPATH$SPLG_PINK]"
  COLOR=$SPLG_LBLUE
  if [ $USER == 'root' ]; then
    COLOR=$SPLG_PINK
  fi

  # CurrentDIR
  CDIR=$(echo $PWD | sed "s:$HOME:~:g")

  if [ ! -z $SHORTPATH ]; then
    # SHORT DIR
    CDIR=$(echo $PWD | sed "s:${HOME}:~:" | sed "s:/\(.\)[^/]*:/\1:g" | sed "s:/[^/]*$:/$(basename $PWD):")
  fi

  # Hide path
  if [ ! -z $HIDE_PATH ]; then
    CDIR=$(echo $CDIR | sed "s:$HIDE_PATH:▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒:g")
  fi

  echo -e "\[$STATUS\]\[$COLOR\]\u\[$SPLG_LGREY\] \[$SPLG_ORANGE\]$CDIR $(git_branch)"
}

# Generate the prompt
function prompt() {
    local EXIT="$?"
    compensate=71
    STATUS="\[$SPLG_GREEN\]▸ \[$CLEAR\]"
    if [ $EXIT != 0 ]; then
      STATUS="\[$SPLG_PINK\]▸ \[$CLEAR\]"
    fi

    export GOPATH="${HOME}/go"
    unset PATH
    PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
    PATH="/usr/local/sbin:$PATH"
    PATH="$HOME/bin:$PATH"
    PATH="~/Library/Android/sdk/platform-tools:$PATH"
    PATH="/usr/local/opt/go/libexec/bin:/usr/local/bin:$PATH:${GOPATH}/bin"

    if [ -d ".chef" ]; then
      PATH="$HOME/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/bin:/opt/chefdk/embedded/bin:$PATH"
    fi

    export PATH

    HOST=$(hostname)
    PROMPT_CHAR='$'
    if [ $USER == 'root' ]; then
      PROMPT_CHAR='#'
    fi

    PS1=$(printf "%*s\r%s\n\[$SPLG_DGREY\]$HOST\[$CLEAR\] \[$SPLG_PURPLE\]$PROMPT_CHAR\[$CLEAR\] " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
}
PROMPT_COMMAND=prompt
