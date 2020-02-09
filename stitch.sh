#!/bin/bash

for i in *.png; do
    [ -f "$i" ] || break
    filename="${i%.*}"
    label=""

    if [ "$filename" = "1" ]; then
        label="Before"
    else
        label="After"
    fi

    convert -gravity center $i -font Arial -pointsize 40 label:"$label" +swap -append label:" " $i
done

convert 1.png 2.png +append output.png
