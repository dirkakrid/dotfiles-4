#!/bin/bash
#

# Security
function cert {
    openssl req -nodes -sha256 -newkey rsa:4096 -keyout ${@}.key -out ${@}.csr -subj "/C=US/ST=New Jersey/L=Belle Mead/O=sixeightzero/OU=Engineering/CN=${@}"
}

function validate_cert {
  c=$((\
    openssl x509 -noout -modulus -in "${1}" 2>/dev/null| \
      openssl md5; \
    openssl rsa -noout -modulus -in "${2}" 2>/dev/null| \
      openssl md5)\
  |uniq \
    |wc -l);
  test $c -gt 1 && \
    (echo "Validation failed for: ${1}" && exit 0) \
      || \
    echo "Validation succeeded for: ${1}";
}

function  read_cert {
  openssl x509 -noout -text -in "${1}" 2>/dev/null
}
