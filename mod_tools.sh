#!/bin/bash

# Encrypted Zip
function ze {
  zip -er protected.zip $2
}

function a {
  mv {,archive-}$1
}
