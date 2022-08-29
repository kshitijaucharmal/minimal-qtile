#!/usr/bin/sh

## this script uses cht.sh to search for queries

languages=`echo "python java javascript c csharp rust lua processing" | tr ' ' '\n'`
core_utils=`echo "xargs find mv sed awk fzf" | tr ' ' '\n'`

selected=`printf "$languages\n$core_utils" | dmenu`
alacritty -e read -p "query: " query

if printf "$languages" | grep -qs $selected; then
    alacritty -e bash -c "curl cht.sh/$selected/`echo $query | tr ' ' '+'` & read"
else
    alacritty -e bash -c "curl cht.sh/$selected~$query & while [ : ]; do sleep 1; done & read"
fi
