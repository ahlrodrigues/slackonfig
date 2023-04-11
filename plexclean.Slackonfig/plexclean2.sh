#!/bin/bash

cd /home/ahlr/Documents/


gren="$(cat greenlist.txt)"
busca="$(find /home/ahlr/Documents/ -mtime +20 -type f)"


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

# if ! grep "$i" greenlist.txt; then
# echo "feito!"
# fi






