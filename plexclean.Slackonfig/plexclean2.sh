#!/bin/bash

cd /home/ahlr/Documents/


gren="$(cat /home/ahlr/Dropbox/slackonfig/plexclean.Slackonfig/greenlist.txt)"
#busca="$(find /home/ahlr/Dropbox/slackonfig/plexclean.Slackonfig/TEST/ -mtime +1 -type f)"
busca="$(find /home/ahlr/Dropbox/slackonfig/plexclean.Slackonfig/TEST/)"

# for i in *; do
#  find . -mtime +20 -type f
# echo "$i"
# done

echo "$gren"

echo "$busca"

# for a in *; do
# cat greenlist.txt
# echo "$a"
# done

#if ! [grep "$i" $gren]; then
#echo "$i"
# fi

rel=( diff '$busca' '$gren')
echo "$rel"



