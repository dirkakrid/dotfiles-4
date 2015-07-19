#!/bin/bash
#
# ip.sh
# -> returns the IP of the specified interface
function ip() {

  if [ $1 == 'p' ]; then
    curl icanhazip.com
    return
  fi

  if [ $1 == 't' ]; then
    curl icanhaztraceroute.com
    return
  fi

  ifconfig $1 | grep inet | grep -v inet6 | awk '{print $2}'

}
