#!/bin/bash
# DSL for colors
color() {
  echo -e "\033[0m"
  case $1 in
    purple)     color_fg="38;5;135";;
    pink)       color_fg="38;5;198";;
    lightblue)  color_fg="38;5;45";;
    blue)       color_fg="38;5;32";;
    red)        color_fg="38;5;196";;
    darkred)    color_fg="38;5;160";;
    lightgreen) color_fg="38;5;156";;
    green)      color_fg="38;5;154";;
    orange)     color_fg="38;5;208";;
    grey)       color_fg="38;5;242";;
    darkgrey)   color_fg="38;5;239";;
    lightgrey)  color_fg="38;5;249";;
    *)          color_fg="0";;
  esac

  echo -e "\033[${color_fg}m"
  return
}

# Loop through colors
showcolors() {
  for i in {0..255}; do
    echo -n $(tput setaf $i)
    echo "This is color $i"
    echo -n $(tput setaf $(($i - 10)))
    echo -n $(tput setab $i)
    echo "This is color $i still"
    echo -e $SPLG_CLEAR

  done
}

# Legacy support
export SPLG_PURPLE="\033[38;5;135m"
export SPLG_PINK="\033[38;5;198m"
export SPLG_LBLUE="\033[38;5;45m"
export SPLG_DBLUE="\033[38;5;32m"
export SPLG_RED="\033[38;5;196m"
export SPLG_DRED="\033[38;5;160m"
export SPLG_GREEN="\033[38;5;156m"
export SPLG_BGREEN="\033[38;5;154m"
export SPLG_ORANGE="\033[38;5;208m"
export SPLG_GREY="\033[38;5;242m"
export SPLG_DGREY="\033[38;5;239m"
export SPLG_LGREY="\033[38;5;249m"
export SPLG_CLEAR="\033[0m" #$(tput sgr0)
export CLEAR=$SPLG_CLEAR

# color(1) completion
