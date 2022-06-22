#!/bin/bash

filenames=("$@")

for filename in "${filenames[@]}"; do
    dir=$(realpath $(dirname $filename))
    text=$(basename $filename | sed -E 's/\.(png|jpg)$//i')
    extension=$(echo $filename | grep -Eoi "(png|jpg)$")
    new_filename="${text}_foni.${extension}"
    convert $filename -fill "#FF000050" -gravity Center -pointsize 300 -annotate 0 "$text" "$dir/$new_filename"
done
