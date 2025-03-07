#!/bin/bash

FILELOGS="$HOME/logs.txt"
function show_help()
{
    echo "cml functions:"
    echo "cml sl - start write you commands in logs"
    echo "cml rm - remove utilit in you system"
    echo "cml swl - show txt file logs"
    echo "cml cl - clean txt file logs"
    echo "cml rml - remove txt file logs"
}
function remove_util()
{
    sudo rm -rf /usr/local/bin/cml
    remove_util
    hash -r
}
function start_log() 
{
    if [ ! -f "$FILELOGS" ]; then
        sudo touch FILE_LOGS
        echo "Log file created: $FILELOGS"
    else
        echo "Log file already exists: $FILELOGS"
    fi
    if ! grep -q "PROMPT_COMMAND" "$HOME/.bashrc"; then
        echo "export PROMPT_COMMAND='echo \"\$(whoami): \$(date): \\\$BASH_COMMAND\" >> $FILELOGS'" >> "$HOME/.bashrc"
        source "$HOME/.bashrc"
    fi
}
function disable_logging() {
    sed -i "/PROMPT_COMMAND/d" "$HOME/.bashrc"
    source "$HOME/.bashrc"
}
function show_logs() 
{
    cat $FILELOGS
}
function clean_logs() 
{
    > $FILELOGS
}
function remove_logs() 
{
    rm $FILELOGS
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
        ;;
    sl)
        start_log
        ;;
    swl)
        show_logs
        ;;
    cl)
        clean_logs
        ;;
    rml)
        remove_logs
        ;;

esac
source "$HOME/.bashrc"