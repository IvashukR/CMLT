#!/bin/bash
if command -v curl &> /dev/null; then
    echo "Please Install curl on you sysytem"
    exit 1
fi
name_utilits = $0
curl -o /usr/local/bin/cml https://raw.githubusercontent.com/IvashukR/CMLT/master/cml_utils.sh
chmod +x /usr/local/bin/cml
echo "Utilits launched"
function show_help()
{
    echo "cml functions:"
    echo "cml start - start write you commands in logs"
}
case $1 in
    help)
        show_help
        ;;
esac