#!/bin/bash

FILE_LOGS="/usr/local/bin/cml_logs.txt"
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
    hash -r
}
function start_log() 
{
    if [ ! -f "$FILE_LOGS" ]; then
        sudo touch $FILE_LOGS
        chmod +x $FILE_LOGS
        echo "Log file created: $FILE_LOGS"
    else
        echo "Log file already exists: $FILE_LOGS"
    fi
    if ! grep -q "PROMPT_COMMAND" "$HOME/.bashrc"; then
        echo 'export PROMPT_COMMAND="echo \"\$(whoami): \$(date): \\\$BASH_COMMAND\" >> '"$FILE_LOGS"'"' >> "$HOME/.bashrc"
        source "$HOME/.bashrc"
    fi
}
function disable_logging() {
    sed -i "/PROMPT_COMMAND/d" "$HOME/.bashrc"
    source "$HOME/.bashrc"
}
function show_logs() 
{
    sudo cat $FILE_LOGS
}
function clean_logs() 
{
    > $FILE_LOGS
}
function remove_logs() 
{
    rm $FILE_LOGS
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