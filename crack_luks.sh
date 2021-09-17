#!/bin/bash
# https://github.com/angeling11
# by natryvat
# Based on https://dfir.science/2014/08/how-to-brute-forcing-password-cracking.html

if [ $# -ne 2 ]; then
    echo "Usage:"
    echo "./crack_luks <encrypted disk> <wordlist>"
    exit 1
fi

if [ $EUID -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi

if file $1 | grep -qv "LUKS encrypted file"; then
    echo "File is not a LUKS encrypted file."
    exit 1
fi

while read i; do
    echo -ne "\r\033[KTrying: \"$i\"..."
    echo $i | cryptsetup open $1 --test-passphrase -T 1 2> /dev/null
    if [ $? -eq 0 ]; then
        echo -e "\nPassword: \"$i\""
        break
    fi
done < $2
