#!/bin/bash

function nc {
    nc -z ${@}
}

# Networking
function lldp {
    sudo tcpdump -vvv -i any -c 1 ether proto 0x88cc
}

function nscan() {
  echo "TCP-ACK Scanning target: $1"
  sudo nmap -sA -Pn -p 20,21,23,25,80,443,1194,8443 $1
}
