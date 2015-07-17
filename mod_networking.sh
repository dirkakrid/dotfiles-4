#!/bin/bash

function nc {
    nc -z ${@}
}

# Networking
function lldp {
    sudo tcpdump -vvv -i any -c 1 ether proto 0x88cc
}
