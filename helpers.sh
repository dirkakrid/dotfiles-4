#!/usr/bin/env bash

# Helper function for outputting information

# A log will offset the start to match success and errors
function log() {
  echo -e "==> ${@}"
}

# A success will provide a green indicator at the beggining of the output
function success() {
  echo -e "\033[0m[\033[38;5;2m*\033[0m] ${@}"
}

# Error will retun a red indication at the beggining of the output
function error() {
  echo -e "\033[0m[\033[38;5;1m*\033[0m] ${@}"
}
