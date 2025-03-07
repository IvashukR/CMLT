#!/bin/bash
name_utilit = $0
function show_help()
{
    echo "cml functions:"
    echo "cml start - start write you commands in logs"
}
if [[$# -eg 0]]; then
    echo "not have argument, try $name_utilit help"
fi
case $1 in
    help)
        show_help
        ;;
esac