#!/bin/bash

# Default values for optional parameters
image1="1.png"
caption1="Before"
image2="2.png"
caption2="After"

# Parse command line arguments
while [ "$#" -gt 0 ]; do
  case "$1" in
    --image1) image1="$2"; shift 2;;
    --caption1) caption1="$2"; shift 2;;
    --image2) image2="$2"; shift 2;;
    --caption2) caption2="$2"; shift 2;;
    *) echo "Unknown parameter: $1"; exit 1;;
  esac
done

# Function to add captions to images
add_caption() {
    local image="$1"
    local caption="$2"

    [ -f "$image" ] || { echo "File not found: $image"; return 1; }
    filename="${image%.*}"
    convert -gravity center "$image" -font Arial -pointsize 40 label:"$caption" +swap -append label:" " "$image"
}

add_caption "$image1" "$caption1"
add_caption "$image2" "$caption2"

convert -border 5 "$image1" "$image2" +append output.png
