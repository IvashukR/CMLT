#!/bin/bash
if ! command -v curl &> /dev/null; then
    echo "Please Install curl on you sysytem"
    exit 1
fi
curl -o /usr/local/bin/cml https://raw.githubusercontent.com/IvashukR/CMLT/master/cml_utils.sh
chmod +x /usr/local/bin/cml
echo "Utilits launched"