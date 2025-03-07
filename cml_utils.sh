#!/bin/bash
function show_help()
{
    echo "cml functions:"
    echo "cml start - start write you commands in logs"
}
function remove_util()
{
    sudo rm -rf /usr/local/bin/cml
}
if [ "$#" -eq 0 ]; then
    echo "not have argument, try cml help"
fi

case $1 in
    help)
        show_help
        ;;
    rm)
        remove_util
esac