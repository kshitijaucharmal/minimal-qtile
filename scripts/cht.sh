#!/usr/bin/bash

## this script uses cht.sh to search for queries

languages=`echo "python java javascript c cpp csharp rust lua" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk fzf man grep bash zsh fish" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | dmenu -sb "#a93542" -p "Language Select " -i -l 10`
read -p "Query: " query

if printf "$languages" | grep -qs $selected; then
    bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & while [ : ]; do sleep 1; done"
else
    bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done"
fi
