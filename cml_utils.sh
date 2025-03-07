#!/bin/bash
function show_help()
{
    echo "cml functions:"
    echo "cml start - start write you commands in logs"
}
echo "not have argument, try cml help"

case $1 in
    help)
        show_help
        ;;
esac