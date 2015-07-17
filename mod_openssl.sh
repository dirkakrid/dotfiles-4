#!/bin/bash
#

# Security
function cert {
    openssl req -nodes -sha256 -newkey rsa:4096 -keyout ${@}.key -out ${@}.csr -subj "/C=US/ST=New Jersey/L=Belle Mead/O=sixeightzero/OU=Engineering/CN=${@}"
}
