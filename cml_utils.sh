#!/bin/bash
function show_help()
{
    echo "cml functions:"
    echo "cml start - start write you commands in logs"
}
if [ "$#" -eq 0 ]; then
    echo "not have argument, try cml help"
fi

case $1 in
    help)
        show_help
        ;;
esac