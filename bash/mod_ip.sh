#!/bin/bash
#
# ip.sh
# -> returns the IP of the specified interface
function ip() {

  if [[ $1 == 'p' ]]; then
    curl icanhazip.com
    return
  fi

  if [[ $1 == 't' ]]; then
    curl icanhaztraceroute.com
    return
  fi

  if [[ ! -z $1 ]]; then
    ifconfig $1 | grep inet | grep -v inet6 | awk '{print $2}'
    return
  fi

  IFACES=$(ifconfig -l)
  for i in $IFACES; do
    IP=$(ifconfig $i | grep inet | grep -v inet6 | awk '{print $2}')
    if [[ ! -z $IP ]]; then
      echo $(printf $SPLG_GREEN)$i$(printf $CLEAR): $IP
    fi
  done

}
