#!/usr/bin/bash

## this script uses cht.sh to search for queries

languages=`echo "python java javascript c csharp rust lua" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk fzf man grep" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | fzf`
read -p "Query: " query

if printf "$languages" | grep -qs $selected; then
    curl cht.sh/$selected/`echo $query | tr ' ' '+'` | less
else
    curl cht.sh/$selected~$query | less
fi
