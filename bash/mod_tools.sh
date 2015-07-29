#!/bin/bash

# Encrypted Zip
function ze {
  zip -er protected.zip $2
}

function ar {
  mv {,archive-}$1
}
