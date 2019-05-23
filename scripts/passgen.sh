#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Please provide a length (e.g. \`urandgen 40\`)!";
  exit 1;
fi

# I rather use the whole list of characters and add/remove one by hand then to screw around with a-zA-Z9-9...
cat /dev/urandom | tr -dc 'qwertzuiopasdfghjklyxcvbnmQWERTZUIOPASDFGHJKLYXCVBNM1234567890,.-;:_!@§$%&/()=?`*+' | head -c $1
echo ""
